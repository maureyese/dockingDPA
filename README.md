# Molecular Docking and Dynamics for DPAHelix project

This repository corresponds to one of the five computational biology analyses of the DPAHelix project in the GOGEC Competition of 2026.

> **Objective**: Identify the potential activity of DPA as a sunscreen through molecular docking and dynamics.

We worked using VS Code, along with the WSL extension (Ubuntu 22.04) as our development environment (Only-windows users).

1. WSL Installation: https://learn.microsoft.com/en-us/windows/wsl/install
2. VS Code Installation: https://code.visualstudio.com/docs/setup/windows#_install-vs-code-on-windows
3. WSL extension on VS Code: https://code.visualstudio.com/docs/remote/wsl

_(The following activities may not be ordered exactly as described in the final written report delivered in the competition)_

## Activity 1: Physicochemical and toxicity properties of DPA

We analyzed the physicochemical and toxicity properties of DPA through network pharmacology databases. We did not use any code in this case. (TODO: Describe how we created the structure of dipicolinate with calcium ion).

We accessed to the following databases:

- PubChem: https://pubchem.ncbi.nlm.nih.gov/
- SwissADME: https://www.swissadme.ch/
- ADMETlab: https://admetlab3.scbdd.com/
- Tox-Prediction-II: https://tox.charite.de/protox3/index.php?site=compound_input
- Molinspiration: https://molinspiration.com/

We compared the results with well-stablished active compounds from FDA-approved sunscreens listed on: https://www.fda.gov/media/122882/download. A detailed interpretation of the results is found in folder: ```01_pharmprop/```. (TODO: Add interpretation and upload results)

## Activity 2: Mutagenic activity of DPA

(TODO: Write)

## Activity 3: Photodegradation modeling of DPA

(TODO: Write)

## Activity 4: Formulation of DPA

(TODO: Write)

## Activity 5: Dynamics of DPA in sunscreen mixture

(TODO: Write)

1. Analyze the stability of the compound's most photodegradable bonds. Stabilizing compounds found in the literature can be added to see how much photodegradation is reduced through non-covalent bonding with DPA.

2. Simulate the miscibility of the ingredients (e.g., DPA in silicone oil versus water). Calculate diffusion coefficients to predict phase separation.

3. Analyze the permeability of DPA by simulating a cell membrane.

4. Analyze potential interactions of DPA with skin proteins. The assumption is that if DPA interacts with skin proteins, it may be subject to systemic absorption and reduced UV protection.