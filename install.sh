mkdir -p .devcontainer

cat <<EOL > .devcontainer/devcontainer.json
{
    "name": "My Codespace (Updated)",
    
    "image": "mcr.microsoft.com/devcontainers/python:3.12",

    "features": {
        "ghcr.io/devcontainers/features/sshd:1": {}
    },

    "postCreateCommand": "pip install --upgrade pip && pip install pyTelegramBotAPI",

    "postStartCommand": "REPO_NAME=\$(basename \$(git rev-parse --show-toplevel)); python3 /workspaces/\$REPO_NAME/m.py",

    "customizations": {
        "vscode": {
            "settings": {
                "python.defaultInterpreterPath": "/usr/local/bin/python"
            },
            "extensions": [
                "ms-python.python",
                "ms-python.vscode-pylance"
            ]
        }
    }
}
EOL

git add .devcontainer/devcontainer.json
git commit -m "Updated devcontainer with Python 3.12 + auto install deps + auto run script"
git push origin main
