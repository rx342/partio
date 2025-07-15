#!/usr/bin/env nu

def translate [ direction: string, text: string ] {
  match $direction {
    "en-vn" => { trans -b en:vi $text }
    "vn-en" => { trans -b vi:en $text }
    "zh-en" => { trans -b zh:en $text }
    "en-zh" => { trans -b en:zh $text }
    _ => { "Unknown language" }
  }
}

def input_text [ direction: string ] {
  let text = rofi -dmenu -p "Enter text to translate" | str trim
  if ($text != "") {
    let cleaned = $text | str replace --regex '[[:cntrl:]]' "" | str replace --regex '[^[:print:]]' ""
    let result = translate $direction $cleaned
    let formatted = $result | fold -s -w 50
    echo $formatted | rofi -dmenu -p "Translation"
  }
}

def main [] {
  let choice = echo "en -> vn\nvn -> en\nen -> cn\ncn -> en" | rofi -dmenu -p "Select Translation Mode" | str trim
  match $choice {
    "en -> vn" => { input_text "en-vn" }
    "vn -> en" => { input_text "vn-en" }
    "en -> cn" => { input_text "en-zh" }
    "cn -> en" => { input_text "zh-en" }
    _ => { }
  }
}
