<?php

const TYPE_ACCESSED = 3;
// TODO consider increment to allow for AI type 
// TODO understand if type 2 is used
const TYPE_IMAGE = 1;
const TYPE_URL = 0;

function getOutgoingLinks($db, $data_table)
{
    try {
        $outLinks = '';
        $rowsNeeded = 2;

        // Part 1: Current link (newest accessed after being modified)
        $sql1 = "SELECT type, accessed, address FROM " . $data_table . " WHERE accessed > modified ORDER BY accessed DESC LIMIT 1";
        $stmt = $db->prepare($sql1);
        $stmt->execute();

        if ($stmt->rowCount() > 0) {
            $row = $stmt->fetch(PDO::FETCH_ASSOC);
            $outLinks .= link_row($row['type'], $row['address'], true, true);
        } else {
            $outLinks = message_row("No current links");
        }

        // Part 2: Next links (oldest active accessed of accessed = modified, then oldest active accessed)
        $sql2 = "SELECT type, accessed, address FROM " . $data_table . " WHERE (`type` < " . TYPE_ACCESSED . ") AND accessed = modified ORDER BY accessed ASC LIMIT 2";
        $stmt = $db->prepare($sql2);
        $stmt->execute();
        $rows1 = $stmt->rowCount();

        if ($rows1 > 0) {
            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                $outLinks .= link_row($row['type'], $row['address'], true, false);
            }
        }

        if ($rows1 < $rowsNeeded) {
            // Check time in local gallery time
            // TODO: update this for ZKM
            $time = localtime();
            $hour = ($time[2] + 15) % 24;

            if (SB_DISABLE_GALLERY_HOURS_CHECK || (10 <= $hour && $hour < 18)) {
                $sql3 = "SELECT type, accessed, address FROM " . $data_table . " WHERE (`type` < " . TYPE_ACCESSED . ") ORDER BY accessed ASC LIMIT " . ($rowsNeeded - $rows1);
                $stmt = $db->prepare($sql3);
                $stmt->execute();

                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    $outLinks .= link_row($row['type'], $row['address'], true, false);
                }
            } else {
                $outLinks .= message_row("Default link outside gallery hours<br><br>");
            }
        }

        return $outLinks;
    } catch (PDOException $e) {
        error_log("Database error in getOutgoingLinks: " . $e->getMessage());
        return message_row("An error occurred while retrieving outgoing links.");
    }
}

function getIncomingLinks($db, $data_table)
{
    try {
        $inLinks = '';

        $sql = "SELECT type, modified, address FROM " . $data_table . " 
                WHERE (`type` < " . TYPE_ACCESSED . ") AND (id > :numDefaultLinks) 
                ORDER BY modified DESC LIMIT 3";

        $stmt = $db->prepare($sql);
        $numDefaultLinks = SB_NUM_DEFAULT_LINKS; // Create a variable to hold the constant value
        $stmt->bindParam(':numDefaultLinks', $numDefaultLinks, PDO::PARAM_INT);
        $stmt->execute();

        $rows = $stmt->rowCount();

        if ($rows > 0) {
            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                $inLinks .= link_row($row['type'], $row['address'], false, false);
            }
        } else {
            $inLinks = message_row("No incoming links");
        }

        return $inLinks;
    } catch (PDOException $e) {
        error_log("Database error in getIncomingLinks: " . $e->getMessage());
        return message_row("An error occurred while retrieving incoming links.");
    }
}

function link_row($type, $link, $isOutLink, $isCurrent)
{
    $isURL = ($type == TYPE_URL);
    $iconImg = $isURL ? "images/sb_url.gif" : "images/sb_img.gif";
    $class = $isOutLink ? 'out_links' : 'in_links';
    $class .= $isCurrent ? ' current' : '';
    return "<tr class=\"{$class}\"><td class=\"icon\"><img src=\"{$iconImg}\" width=\"12\" height=\"13\" align=\"middle\" vspace=2></td>" .
        "<td>" . htmlspecialchars($link) . "</td></tr>\n";
}

function message_row($message)
{
    return "<tr><td colspan=\"2\" class=\"message_row\">" . htmlspecialchars($message) . "</td></tr>\n";
}

function set_headers()
{
    header("Expires: Mon, 26 Jul 2017 05:00:00 GMT");
    header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
    header("Cache-Control: no-store, no-cache, must-revalidate");
    header("Cache-Control: post-check=0, pre-check=0", false);
    header("Pragma: no-cache");
}

function getNextLink($db, $data_table)
{
    try {
        // First, try to get an unaccessed active seed
        $sql = "SELECT id, type, address FROM " . $data_table . " 
                WHERE (accessed = modified) AND (`type` < " . TYPE_ACCESSED . ") 
                ORDER BY accessed ASC LIMIT 1";
        $stmt = $db->prepare($sql);
        $stmt->execute();

        if ($stmt->rowCount() == 0) {
            // If no unaccessed seeds, get the oldest accessed active seed
            $sql = "SELECT id, type, address FROM " . $data_table . " 
                    WHERE (`type` < " . TYPE_ACCESSED . ") ORDER BY accessed ASC LIMIT 1";
            $stmt = $db->prepare($sql);
            $stmt->execute();
        }

        if ($stmt->rowCount() > 0) {
            $row = $stmt->fetch(PDO::FETCH_ASSOC);
            $id = $row['id'];
            $type = $row['type'];
            $address = $row['address'];

            // Update the accessed timestamp
            $updateSql = "UPDATE " . $data_table . " SET `accessed` = NOW() ";
            if ($id > SB_NUM_DEFAULT_LINKS) {
                $updateSql .= ", `type` = " . TYPE_ACCESSED . " ";
            }
            $updateSql .= "WHERE id = :id";
            $updateStmt = $db->prepare($updateSql);
            $updateStmt->bindParam(':id', $id, PDO::PARAM_INT);
            $updateStmt->execute();

            $isURL = ($type == 0);
            $url = $isURL ? $address : "http://images.google.com/images?q=" . urlencode($address);

            return ['url' => $url, 'isURL' => $isURL];
        }

        return null;
    } catch (PDOException $e) {
        error_log("Database error in getNextLink: " . $e->getMessage());
        return null;
    }
}

function checkActiveLinks($db, $data_table)
{
    try {
        $sql = "SELECT id FROM " . $data_table . " 
                WHERE (`type` < " . TYPE_ACCESSED . ") ORDER BY accessed DESC LIMIT 1";
        $stmt = $db->prepare($sql);
        $stmt->execute();

        if ($stmt->rowCount() > 0) {
            $row = $stmt->fetch(PDO::FETCH_ASSOC);
            return ($row['id'] > SB_NUM_DEFAULT_LINKS);
        }

        return false;
    } catch (PDOException $e) {
        error_log("Database error in checkActiveLinks: " . $e->getMessage());
        return false;
    }
}
