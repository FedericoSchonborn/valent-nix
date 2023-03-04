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
  version = "unstable-2023-03-02";

  src = fetchFromGitHub {
    owner = "andyholmes";
    repo = "valent";
    rev = "4b60f28f46bc948c5f3b30189bb9b5fbe29d2745";
    fetchSubmodules = true;
    sha256 = "sha256-ltf/srQLqtqE71sxEh7VTQqXy2wOpTSdGDsjITOt3f8=";
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
