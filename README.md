# Molecular Docking and Dynamics for DPAHelix project

This repository corresponds to one of the five computational biology analyses of the DPAHelix project in the GOGEC Competition of 2026.

> **Objective**: Identify the potential activity of DPA as a sunscreen through molecular docking and dynamics.

- **DPAHelix Members involved (No specific order)**: César Alejandro Martínez Ramírez, Jesús Daniel Hernández Elizondo.
- **Advisor**: LBG Mauricio Reyes-Elizondo
- **PI**: Dr J Claudio Moreno-Rocha

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
- ProTox 3.0: https://tox.charite.de/protox3/

We compared the results with well-stablished active compounds from FDA-approved sunscreens listed on: https://www.fda.gov/media/122882/download. A detailed interpretation of the results is found in folder: ```01_pharmprop/```.

An additional analysis for ProTox 3.0 Interpretation was performed using an R script, found at: ```01_pharmprop/protox/ProTox 3.0 Toxicity results analyzer.R```

## Activity 2: Mutagenic activity of DPA

To evaluate the mutagenic potential of DPA, a biomolecular simulation was performed using Boltz-2 via the Tamarind Bio platform, aiming to predict if DPA could act as an intercalating agent, binding to DNA. A 5 samples simulation was run, with standard settings. As DNA input the sequence used was “CCATCGCTACC”, previously used by Pushkaran and Arabi (2025) as a model in an intercalating in silico analysis, whereas the molecule input was the SMILES format of the DPA molecule, ```[O-]C(=O)C1=CC=CC(=N1)C([O-])=O```.

- Tamarind Bio Platform: https://www.tamarind.bio/

## Activity 3: Photodegradability Analysis of DPA (Unfinished)

Unfortunately, a model to evaluate the photodegradability of DPA was not completed during the GOGEC competition period due to insufficient time to fully understand the ```psi4``` library and its necessary parameters. Looking ahead to the project, we hope to complete this analysis to understand the critical UV light absorption points at different wavelengths. Found at: ```02_photodegradability.ipynb```

## Activity 4: Formulation of DPA

The formulation strategy for incorporating DPA into sunscreen products employs a computational chemistry approach to predict optimal formulation parameters. This methodology integrates molecular property analysis, three-dimensional structural modeling, and pH-dependent stability calculations to establish evidence-based formulation guidelines. Found at: ```03_formulation_strategy.ipynb```

The analysis begins with molecular property characterization by retrieving DPA structural data from PubChem (CID: 10367) and generating three-dimensional conformations using ```RDKit``` ETKDG algorithm. MMFF94 force field calculations then assess the optimized molecule's internal potential energy to evaluate stability and formulation behavior influences.

The computational analysis calculates key pharmaceutical descriptors including partition coefficient (LogP), topological polar surface area, and hydrogen bonding parameters to characterize DPA's physicochemical profile. pH-dependent stability modeling implements a diprotic acid mathematical model using experimentally determined pKa values to generate stability curves across physiologically relevant conditions.

All relevant data is found at: ```03_formulation_strategy.ipynb```

## Activity 5: Dynamics of DPA in sunscreen mixture

A molecular dynamics strategy was proposed to analyze the stability of DPA in a sunscreen formulation. However, we were unable to finalize the scripts during the GOGEC competition period. We hope to begin these analyses in the future to obtain more detailed information about the behavior of DPA in the sunscreen:

1. Analyze the stability of the compound's most photodegradable bonds. Stabilizing compounds found in the literature can be added to see how much photodegradation is reduced through non-covalent bonding with DPA.

2. Simulate the miscibility of the ingredients (e.g., DPA in silicone oil versus water). Calculate diffusion coefficients to predict phase separation.

3. Analyze the permeability of DPA by simulating a cell membrane.

4. Analyze potential interactions of DPA with skin proteins. The assumption is that if DPA interacts with skin proteins, it may be subject to systemic absorption and reduced UV protection.

An attempt was made to carry out this last point through molecular docking, not only with skin proteins, but also with immune proteins to evaluate the biocompatibility of DPA and prevent their excessive prolongation in the skin and a potential immune reaction, found at: ```01_docking_human_proteins.ipynb```. We could observe the interaction between DPA and the proposed receivers. According to the AutoDock Vina analysis all proteins tested could interact with DPA having a mean affinity value of -4.95 kcal mol-1. Unfortunately, we think these results might be biased or false positives, and due to a lack of time we cannot offer a deeper insight, leaving open this area to future research with the help of experts in disciplines such as physical chemistry, immunology, and analytical chemistry in order to corroborate our findings. The files related to these tests can be consulted on the annexed repository.

## END