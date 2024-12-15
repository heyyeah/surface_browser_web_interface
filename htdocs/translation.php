<?php
class Translator {
    private $translations = [];
    private $lang = 'en';

    public function __construct($lang = 'en') {
        $this->setLanguage($lang);
    }

    public function setLanguage($lang) {
        $this->lang = $lang;
        $file = __DIR__ . '/languages/' . $lang . '.json';
        if (file_exists($file)) {
            $this->translations = json_decode(file_get_contents($file), true);
            if ($this->translations === null) {
                error_log("Failed to parse JSON from language file: " . $file);
                $this->translations = [];
            }
        } else {
            error_log("Language file not found: " . $file);
            $this->translations = [];
        }
    }

    public function translate($key) {
        return $this->translations[$key] ?? $key;
    }

    public function translateWithLinks($key) {
        $text = $this->translations[$key] ?? $key;
        $linkTargets = $this->translations['link_targets'] ?? [];
        
        foreach ($linkTargets as $linkKey => $linkData) {
            $pattern = "/{" . $linkKey . "}(.*?){\/link}/";
            $replacement = '<a href="' . $linkData['href'] . '" target="' . $linkData['target'] . '">$1</a>';
            $text = preg_replace($pattern, $replacement, $text);
        }
        
        return $text;
    }
}

function t($key) {
    global $translator;
    return $translator->translate($key);
}

function t_links($key) {
    global $translator;
    return $translator->translateWithLinks($key);
}