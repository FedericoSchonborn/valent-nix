{
  lib,
  stdenv,
  fetchFromGitHub,
  meson,
  ninja,
  gettext,
}:
stdenv.mkDerivation rec {
  pname = "gnome-shell-extension-valent";
  version = "unstable-2023-03-01";

  src = fetchFromGitHub {
    owner = "andyholmes";
    repo = "gnome-shell-extension-valent";
    rev = "dd054951ffbc61f0ffda1c7b2167c6f185c74ab3";
    hash = "sha256-cCwB4bVx00NRYfLrduW0sRjvg3ZneyMr+p/iEMCXI40=";
  };

  nativeBuildInputs = [
    meson
    ninja
    gettext
  ];

  passthru = {
    extensionUuid = "valent@andyholmes.ca";
    extensionPortalSlug = "Valent";
  };

  meta = with lib; {
    description = "GNOME Shell integration for Valent";
    homepage = "https://github.com/andyholmes/gnome-shell-extension-valent";
    changelog = "https://github.com/andyholmes/gnome-shell-extension-valent/blob/${src.rev}/CHANGELOG.md";
    license = with licenses; [gpl3Plus cc0];
  };
}
