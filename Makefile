.PHONY: setup
setup:
	pipx install --include-deps yamllint
	pipx install --include-deps ansible
	pipx inject --include-apps ansible molecule
	pipx inject ansible "molecule-plugins[docker,podman]"

.PHONY: lint
lint:
	yamllint .
	ansible-lint

.PHONY: test
test:
	molecule test
