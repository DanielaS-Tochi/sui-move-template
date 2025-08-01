# SUI Move Development Template

This is a GitHub template repository designed to kickstart SUI blockchain development using the Move programming language in a GitHub Codespaces environment. It provides a pre-configured setup with all necessary tools and dependencies, enabling developers to focus on building smart contracts without local machine setup overhead.

## Purpose
The template aims to:
- Simplify the setup of a SUI development environment.
- Leverage GitHub Codespaces for a cloud-based, resource-efficient workflow.
- Provide clear instructions for other developers to use and contribute.
- Ensure a reproducible environment for SUI smart contract development with Move.

## Prerequisites
- A GitHub account with access to Codespaces (free tier or paid plan).
- Basic familiarity with Git, Move, and blockchain concepts.
- No local installation is required, as everything runs in Codespaces.

## Features
- **Pre-installed SUI CLI**: Ready-to-use SUI command-line tools.
- **Move Language Support**: Configured for writing and testing Move smart contracts.
- **Codespaces Configuration**: Optimized `devcontainer.json` for a seamless cloud-based experience.
- **Sample Move Contract**: A basic SUI Move module to get started.
- **Testing Setup**: Pre-configured for running Move unit tests.
- **Badges**: Visual indicators for project status and dependencies.
- **License**: MIT License for open-source collaboration.

## Getting Started

### Step 1: Create a Repository from This Template
1. Click the green **"Use this template"** button on the GitHub repository page.
2. Select **"Create a new repository"**.
3. Choose a repository name, description, and visibility (public or private).
4. Click **"Create repository from template"**.

### Step 2: Open in GitHub Codespaces
1. In your new repository, click the green **"<> Code"** button.
2. Select the **"Codespaces"** tab and click **"Create codespace on main"**.
3. Wait for the Codespace to initialize (this may take a few minutes the first time).

### Step 3: Verify the Environment
Once the Codespace is ready:
1. Open a terminal in the Codespace (Ctrl+` or Terminal > New Terminal in VS Code).
2. Run the following command to verify the SUI CLI installation:
   ```bash
   sui --version

You should see the installed SUI CLI version (e.g., sui 1.37.0).
3. Check Move support by navigating to the sample project:

cd sui-move-example
sui move build

This should compile the sample Move module without errors.
Step 4: Explore the Sample Move Contract
The repository includes a sample Move module in the sui-move-example directory:

Location: sui-move-example/sources/example.move
Purpose: Demonstrates a basic SUI object with a counter.
Structure:

module example::counter {
    use sui::object::{Self, UID};
    use sui::tx_context::TxContext;
    use sui::transfer;

    struct Counter has key, store {
        id: UID,
        count: u64,
    }

    public entry fun create(ctx: &mut TxContext) {
        let counter = Counter {
            id: object::new(ctx),
            count: 0,
        };
        transfer::public_transfer(counter, ctx.sender());
    }

    public entry fun increment(counter: &mut Counter) {
        counter.count = counter.count + 1;
    }
}

Step 5: Build and Test

Build the contract:

cd sui-move-example
sui move build

Run tests:

sui move test

Tests are located in sui-move-example/tests/example_tests.move.

Step 6: Publish to SUI Testnet
To deploy the sample contract to the SUI testnet:

Ensure you have a SUI wallet configured:

sui client

Follow prompts to create or import a wallet if needed.
Publish the module:

cd sui-move-example
sui client publish --gas-budget 10000000

Adjust the gas budget as needed based on testnet conditions.

Repository Structure

├── .devcontainer/
│   ├── devcontainer.json       # Codespaces configuration
│   └── Dockerfile              # Custom Docker image for SUI
├── sui-move-example/
│   ├── Move.toml               # Move project configuration
│   ├── sources/
│   │   └── example.move        # Sample Move module
│   ├── tests/
│   │   └── example_tests.move  # Unit tests
├── .gitignore                  # Git ignore file
├── LICENSE                     # MIT License
├── README.md                   # This file

Customizing the Environment

Add Dependencies: Update sui-move-example/Move.toml to include additional Move packages.
Modify devcontainer.json: Adjust VS Code extensions or container settings in .devcontainer/devcontainer.json.
Update Dockerfile: Install additional tools in .devcontainer/Dockerfile if needed.
Dotfiles: Add a public dotfiles repository to .devcontainer/devcontainer.json for shell personalization.

Contributing
Contributions are welcome! To contribute:

Fork the repository.
Create a feature branch (git checkout -b feature/your-feature).
Commit changes (git commit -m 'Add your feature').
Push to the branch (git push origin feature/your-feature).
Open a pull request.

Please read CONTRIBUTING.md for details on our code of conduct and submission process.
Badges
<img src="https://img.shields.io/badge/SUI-1.37.0-blue" alt="SUI Version">
<img src="https://img.shields.io/badge/License-MIT-green" alt="License">
<img src="https://img.shields.io/badge/Codespaces-Ready-brightgreen" alt="Codespaces Ready">
License
This project is licensed under the MIT License - see the LICENSE file for details.
Acknowledgments

SUI Documentation for comprehensive guides.
Move Language for smart contract development.
GitHub Codespaces for cloud-based development.

Support
If you encounter issues or have suggestions:

Open an issue in the GitHub repository.
Check the SUI Community for help.
Contact the maintainers via GitHub.



