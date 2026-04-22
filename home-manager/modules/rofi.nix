{ ... }:

{
  xdg.configFile."rofi/config.rasi".text = ''
* {
    font: "JetBrainsMono Nerd Font 12";
    background: #1e1e2e;
    foreground: #cdd6f4;
    selected: #89b4fa;
    active: #a6e3a1;
    urgent: #f38ba8;
}

window {
    width: 500px;
    border-radius: 12px;
    padding: 10px;
}

mainbox {
    children: [inputbar, listview];
}

inputbar {
    padding: 8px;
    border-radius: 8px;
    background-color: #313244;
}

listview {
    spacing: 6px;
    scrollbar: false;
}

element {
    padding: 8px;
    border-radius: 8px;
}

element selected {
    background-color: #45475a;
    text-color: #89b4fa;
}
'';
}
