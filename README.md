# colicin-ODE-model

#MATLAB code for ODE model in Lerminiaux et al., "Lysis of Escherichia coli by colicin Ib enhances bacterial cross-feeding by releasing active β-galactosidase"

Files:

--Calibration: Table 1, Figure 8--

subm_calibrate_colicin.m: runs optimization routines to find best-fit parameters. Calls subm_fetch_data.m to call data and runs subm_run_colicin.m to generate SSE value for any given paramerization.

subm_fetch_data.m: calls data from subm_Experiment_Data.xlsx

subm_run_colicin.m to generate SSE value for a given paramerization

subm_colicin_plot.m: generates plots of model fits

--Uncertainty Analysis: Table 1--

subm_uncertainty.m: generates senscitivity, idenfifiability, and 95% confidence intervals as reported in Table 1

subm_colicin_prediction_column.m: called by subm_uncertainty.m

--Model Predictions: Figure 9--

subm_bifurcation.m: generate bifurcation plot in manuscript Figure 9A

subm_run_long_term.m: generate time-series simulation data in manuscript Figure 9B, C


