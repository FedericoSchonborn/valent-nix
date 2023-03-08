{
  lib,
  stdenv,
  fetchFromGitHub,
  meson,
  ninja,
  pkg-config,
  wrapGAppsHook,
  desktop-file-utils,
  evolution-data-server-gtk4,
  glib,
  gnutls,
  gst_all_1,
  json-glib,
  libadwaita,
  libpeas,
  libportal-gtk4,
  pulseaudio,
  sqlite,
}:
stdenv.mkDerivation rec {
  pname = "valent";
  version = "unstable-2023-03-08";

  src = fetchFromGitHub {
    owner = "andyholmes";
    repo = "valent";
    rev = "401fda881bc17d2424a621d41c9345f5e9e4f689";
    fetchSubmodules = true;
    hash = "sha256-8TGl+U0tdR6jCTURATY86SxnjU6UiZUyMLrrmKPyvKw=";
  };

  nativeBuildInputs = [
    desktop-file-utils
    meson
    ninja
    pkg-config
    wrapGAppsHook
  ];

  buildInputs = [
    evolution-data-server-gtk4
    glib
    gnutls
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-base
    json-glib
    libadwaita
    libpeas
    libportal-gtk4
    pulseaudio
    sqlite
  ];

  mesonFlags = [
    "-Dplugin_bluez=true"
  ];

  meta = with lib; {
    description = "Connect, control and sync devices";
    homepage = "https://github.com/andyholmes/valent/";
    changelog = "https://github.com/andyholmes/valent/blob/${src.rev}/CHANGELOG.md";
    license = with licenses; [gpl3Plus cc0];
  };
}
