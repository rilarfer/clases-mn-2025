% epsilon_maquina.m
eps_val = 1.0;
while (1.0 + eps_val) > 1.0
    eps_val = eps_val / 2;
end
eps_val = eps_val * 2;
disp(['Epsilon de máquina: ', num2str(eps_val)]);