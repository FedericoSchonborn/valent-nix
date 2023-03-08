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
  version = "unstable-2023-03-06";

  src = fetchFromGitHub {
    owner = "andyholmes";
    repo = "gnome-shell-extension-valent";
    rev = "9e0283dffcf85d121fc52476864285c779771b89";
    hash = "sha256-5/Joy2uFb0zAuyhWkb8xRrVr+G4DvKYFuYaIYAQpUek=";
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
