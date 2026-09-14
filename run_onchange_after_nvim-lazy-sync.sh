#!/bin/bash

# nvim config hash: {{ range (glob (joinPath .chezmoi.sourceDir "dot_config/nvim/**")) }}{{ include . | sha256sum }}{{ end }}

nvim --headless "+Lazy! sync" +qa
