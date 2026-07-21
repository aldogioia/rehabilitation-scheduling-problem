TARGET_COLS = ['target_assignments', 'target_assN', 'target_assO', 'target_assA', 'target_assCP', 'target_assCN', 'target_assMAC']
N_TRIALS = 100
SEED = 42


class TabPFNQuantileWrapper:
    def __init__(self, fitted_model, quantile):
        self.fitted_model = fitted_model
        self.quantile = quantile
        
    def predict(self, X):
        preds = self.fitted_model.predict(
            X, 
            output_type="quantiles", 
            quantiles=[self.quantile]
        )
        
        return preds[0]