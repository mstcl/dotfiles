#!/usr/bin/env python3
"""
Exercise 4
"""
import sys
from copy import deepcopy as dc
from decimal import Decimal
from time import perf_counter

import matplotlib.animation as anim
import matplotlib.pyplot as plt
import matplotlib.collections as clt
import numpy as np
import scipy.integrate as si
import scipy.signal as ss
from scipy.stats import qmc

#################################
#  OPTION INITIATION FUNCTIONS  #
#################################


def run_option_a(global_vars: dict):
    """Execute part a

    :param global_vars: global variable

    """
    x_0 = global_vars["radius_earth"] * float(
        take_input_general("initial x displacement in multiples of R_E (default: 0)")
        or "0"
    )
    y_0 = global_vars["radius_earth"] * float(
        take_input_general("initial y displacement in multiples of R_E (default: 0)")
        or "0"
    )
    v_x_0 = float(take_input_general("initial x velocity in m/s (default: 0)") or "0")
    v_y_0 = float(take_input_general("initial y velocity in m/s (default: 0)") or "0")
    max_time = int(take_input_int("max time to render (default: 0)") or "0")
    x_pos, y_pos, x_vel, y_vel = populate_rk4_1body(
        global_vars, np.array([x_0, y_0, v_x_0, v_y_0]), max_time, False
    )
    stop = check_crash_earth(global_vars, x_pos[1:], y_pos[1:])
    skip = display_orbit_info(global_vars, stop, x_pos, y_pos)
    print("-> Displaying overview of selected orbit")
    input("* Press anything to continue...")
    plot_overview_orbit(
        global_vars,
        x_pos[:stop] / global_vars["radius_earth"],
        y_pos[:stop] / global_vars["radius_earth"],
        False
    )
    print("-> Displaying animation of selected orbit")
    input("* Press anything to continue...")
    filename = f"1orbit_{x_0/global_vars['radius_earth']}_{y_0}_{v_x_0}_{v_y_0}_{global_vars['step_size']}"
    animate_orbit_1body(
        global_vars,
        x_pos[:stop:skip] / global_vars["radius_earth"],
        y_pos[:stop:skip] / global_vars["radius_earth"],
        filename,
        False,
    )
    _ = check_energy_conservation(
        global_vars, x_pos[:stop], y_pos[:stop], x_vel[:stop], y_vel[:stop], True
    )
    run_option_a_aux(global_vars)
    input("* Press anything to return to menu...")


def run_option_a_aux(global_vars: dict):
    """TODO: Docstring for run_option_a_aux.

    :global_vars: TODO
    :returns: TODO

    """
    step_sizes = np.linspace(10, 200, 400)
    errors = np.zeros_like(step_sizes)
    print("-> Investigating impact of step size on energy conservation accuracy.")
    default_variables = np.array([global_vars["radius_earth"], 0, 0, 9000])
    max_time = 30000
    for idx, var in enumerate(step_sizes):
        global_vars["step_size"] = var
        x_pos, y_pos, x_vel, y_vel = populate_rk4_1body(
            global_vars, default_variables, max_time, False
        )
        errors[idx] = check_energy_conservation(
            global_vars, x_pos, y_pos, x_vel, y_vel, False
        )
    plt.scatter(step_sizes, errors)
    plt.xlabel("Step sizes (s)")
    plt.ylabel("Standard deviation in energy per unit rocket mass (J/kg)")
    plt.show()
    plt.cla()
    plt.clf()
    plt.close()
    log_x = np.log(step_sizes)
    log_y = np.log(errors)
    grad, _ = np.polyfit(log_x, log_y, 1)
    plt.loglog(step_sizes, errors)
    plt.title(f"Gradient: {grad}")
    plt.xlabel("log Step sizes (s)")
    plt.ylabel("log Standard deviation in energy per unit rocket mass (J/kg)")
    plt.show()
    plt.cla()
    plt.clf()
    plt.close()


def run_option_b(global_vars: dict):
    """Execute part b

    :param global_vars: global variables

    """
    # NOTE: Nice figure 8: parameters (0, -1.09, -10591, 0)
    x_0 = global_vars["radius_earth"] * float(
        take_input_general("initial x displacement in multiples of R_E (default: 0)")
        or "0"
    )
    y_0 = global_vars["radius_earth"] * float(
        take_input_general("initial y displacement in multiples of R_E (default: 0)")
        or "0"
    )
    v_x_0 = float(take_input_general("initial x velocity in m/s (default: 0)") or "0")
    v_y_0 = float(take_input_general("initial y velocity in m/s (default: 0)") or "0")
    max_time = int(take_input_int("max time to render (default: 0)") or "0")
    x_pos, y_pos, _, _ = populate_rk4_1body(
        global_vars, np.array([x_0, y_0, v_x_0, v_y_0], dtype=np.float_), max_time, True
    )

    stop1 = check_crash_earth(global_vars, x_pos[1:], y_pos[1:])
    stop2 = check_crash_moon(global_vars, x_pos[1:], y_pos[1:])
    stop = stop1 or stop2
    skip = display_orbit_info(global_vars, stop, x_pos, y_pos)
    print("-> Displaying overview of selected orbit")
    input("* Press anything to continue...")
    plot_overview_orbit(
        global_vars,
        x_pos[:stop] / global_vars["radius_earth"],
        y_pos[:stop] / global_vars["radius_earth"],
        True
    )
    print("-> Displaying animation of selected orbit")
    input("* Press anything to continue...")
    filename = f"1orbit_{x_0/global_vars['radius_earth']}_{y_0/global_vars['radius_earth']}_{v_x_0}_{v_y_0}_{global_vars['step_size']}"
    # animate_orbit_1body(
    #     global_vars,
    #     np.concatenate((x_pos[:200:skip], x_pos[200:stop:skip]), axis=None)
    #     / global_vars["radius_earth"],
    #     np.concatenate((y_pos[:200:skip], y_pos[200:stop:skip]), axis=None)
    #     / global_vars["radius_earth"],
    #     filename,
    #     True,
    # )
    animate_orbit_1body(
        global_vars,
        x_pos[:stop:skip] / global_vars["radius_earth"],
        y_pos[:stop:skip] / global_vars["radius_earth"],
        filename,
        True,
    )
    # TODO: How close can you get to the moon without crashing?
    # TODO: How long does the flight to the moon and back take?
    # TODO: How will you know when to halt your calculation?


def run_option_c(global_vars: dict):
    """Execute part c

    :param global_vars: global variables

    """
    is_alt_scale = bool(
        take_input_bool("Use earth-moon distance scale? True/False (default: False)")
        or False
    )
    planet_2_mass = (
        float(
            take_input_general(
                "mass of body 2 in multiples of M_E (body 1's mass) (default: 1)"
            )
            or "1"
        )
        * global_vars["mass_earth"]
    )
    x_0_earth = global_vars["radius_earth"] * float(
        take_input_general(
            "initial body 1 x displacement in multiples of R_E (default: 0)"
        )
        or "0"
    )
    y_0_earth = global_vars["radius_earth"] * float(
        take_input_general(
            "initial body 1 y displacement in multiples of R_E (default: 0)"
        )
        or "0"
    )
    v_x_0_earth = float(
        take_input_general("initial body 1 x velocity in m/s (default: 0)") or "0"
    )
    v_y_0_earth = float(
        take_input_general("initial body 1 y velocity in m/s (default: 0)") or "0"
    )
    x_0_moon = (
        (is_alt_scale) * global_vars["earth_moon_distance"]
        + global_vars["radius_earth"] * (not is_alt_scale)
    ) * float(
        take_input_general(
            "initial body 2 x displacement in multiples of earth-moon-separation or R_E (default: 0)"
        )
        or "0"
    )
    y_0_moon = (
        (is_alt_scale) * global_vars["earth_moon_distance"]
        + global_vars["radius_earth"] * (not is_alt_scale)
    ) * float(
        take_input_general(
            "initial body 2 y displacement in multiples of earth-moon-separation or R_E (default: 0)"
        )
        or "0"
    )
    v_x_0_moon = float(
        take_input_general("initial body 2 x velocity in m/s (default: 0)") or "0"
    )
    v_y_0_moon = float(
        take_input_general("initial body 2 y velocity in m/s (default: 0)") or "0"
    )
    max_time = int(take_input_int("max time to render (default: 0)") or "0")
    # NOTE: Earth starts as a moving body while the moon stays still in i=0
    # NOTE: Earth is "south" of moon to start off
    earth_start = np.array([x_0_earth, y_0_earth, v_x_0_earth, v_y_0_earth])
    # NOTE: Moon starts as a moving body while the earth stays still in i=1
    # NOTE: Moon is north of earth to start off
    moon_start = np.array([x_0_moon, y_0_moon, v_x_0_moon, v_y_0_moon])
    x_pos_earth, y_pos_earth, x_pos_moon, y_pos_moon = populate_rk4_2body(
        global_vars, earth_start, moon_start, max_time, planet_2_mass
    )
    # print("_".join(earth_start.tolist()))
    # print("_".join(moon_start.tolist()))
    # print(np.std(x_pos_earth), np.std(y_pos_earth))

    filename = f"2orbit_{earth_start[0]/global_vars['radius_earth']} _{earth_start[1]/global_vars['radius_earth']}_{earth_start[2]}_{earth_start[3]}_{moon_start[0]/global_vars['radius_earth']} _{moon_start[1]/global_vars['radius_earth']}_{moon_start[2]}_{moon_start[3]}_{global_vars['step_size']}"
    animate_orbit_2body(
        global_vars,
        x_pos_earth[::6] / global_vars["radius_earth"],
        y_pos_earth[::6] / global_vars["radius_earth"],
        x_pos_moon[::6] / global_vars["radius_earth"],
        y_pos_moon[::6] / global_vars["radius_earth"],
        filename,
    )


def run_option_d(global_vars: dict):
    """Execute option d

    :param global_vars: global variables

    """
    pass


##############################
#  PROBLEM 1 MAIN FUNCTIONS  #
##############################


def check_shape(global_vars: dict, x_pos: np.ndarray, y_pos: np.ndarray):
    """TODO: Docstring for check_pos.

    :x_pos: TODO
    :y_pos: TODO
    :returns: TODO

    """
    r_x = (np.max(x_pos) - np.min(x_pos)) / global_vars["radius_earth"]
    r_y = (np.max(y_pos) - np.min(y_pos)) / global_vars["radius_earth"]
    print("-> Orbit radius in x:", r_x, "R_E")
    print("-> Orbit radius in y:", r_y, "R_E")
    if np.abs((r_x / r_y) - 1) <= 0.001:
        print("-> Orbit is approximately circular.")
    else:
        print("-> Orbit is not circular.")


def get_initial_ks_1body(
    global_vars: dict, variables: np.ndarray, is_moon: bool
) -> tuple:
    """Return the k values (time derivs) for each value in variables for 2 bodies

    :global_vars: global variables
    :variables: system variables (x, y, v_x, v_y)
    :returns: (kx, ky, kvx, kvy)

    """
    x, y, v_x, v_y = variables
    denom_1 = (x**2 + y**2) ** (3 / 2)
    denom_2 = 1
    if is_moon:
        denom_2 = (x**2 + (y - global_vars["earth_moon_distance"]) ** 2) ** (3 / 2)
    return (
        v_x,
        v_y,
        -global_vars["grav_constant"]
        * (
            global_vars["mass_earth"] * x / denom_1
            + is_moon * (global_vars["mass_moon"] * x / denom_2)
        ),
        -global_vars["grav_constant"]
        * (
            global_vars["mass_earth"] * y / denom_1
            + is_moon
            * (
                global_vars["mass_moon"]
                * (y - global_vars["earth_moon_distance"])
                / denom_2
            )
        ),
    )


def get_initial_ks_2body(
    global_vars: dict,
    variables_1: np.ndarray,
    variables_2: np.ndarray,
    is_moon: bool,
    moon_mass: float,
) -> tuple:
    """TODO: Docstring for get_initial_ks_2body.

    :global_vars: TODO
    :variables_1: TODO
    :variables_2: TODO
    :returns: TODO

    """
    # NOTE: When calculating moon motion when earth still, use Earth mass, thus
    # is_moon = True
    x, y, v_x, v_y = variables_1
    x_prime, y_prime, _, _ = variables_2
    denom = ((x - x_prime) ** 2 + (y - y_prime) ** 2) ** (3 / 2)
    return (
        v_x,
        v_y,
        -global_vars["grav_constant"]
        * (global_vars["mass_earth"] * is_moon + moon_mass * (not is_moon))
        * (x - x_prime)
        / denom,
        -global_vars["grav_constant"]
        * (global_vars["mass_earth"] * is_moon + moon_mass * (not is_moon))
        * (y - y_prime)
        / denom,
    )


def solve_rk4(
    global_vars: dict,
    k1: np.ndarray,
    k2: np.ndarray,
    k3: np.ndarray,
    k4: np.ndarray,
    variables: np.ndarray,
) -> np.ndarray:
    """TODO: Docstring for solve_rk4.

    :global_vars: TODO
    :k1: TODO
    :k2: TODO
    :k3: TODO
    :k4: TODO
    :variables: TODO
    :returns: TODO

    """
    factor = np.sum(np.column_stack((k1, 2 * k2, 2 * k3, k4)), axis=1)
    return variables + global_vars["step_size"] * (factor) / 6


def display_orbit_info(
    global_vars: dict, stop: None | int, x_pos: np.ndarray, y_pos: np.ndarray
) -> int | None:
    if stop is None:
        skip = (np.size(x_pos) // 200) * (np.size(x_pos) >= 100) + -1 * (
            np.size(x_pos) < 100
        )
        print("-> Stable orbit: Rocket did not crash (or max_time not long enough).")
        check_shape(global_vars, x_pos, y_pos)
    else:
        skip = stop // 200 * (stop >= 100) + -1 * (stop < 100)
        print("-> Unstable orbit: Rocket crashed.")
    return skip if skip != -1 else None


def check_crash_earth(
    global_vars: dict, x_pos: np.ndarray, y_pos: np.ndarray
) -> None | int:
    crash_idx = np.where(
        np.sqrt(x_pos**2 + y_pos**2) <= global_vars["radius_earth"],
        np.where(x_pos),
        -1,
    )
    crash_idx = crash_idx[crash_idx != -1]
    return None if np.size(crash_idx) <= 1 else crash_idx[1] + 1


def check_crash_moon(
    global_vars: dict, x_pos: np.ndarray, y_pos: np.ndarray
) -> None | int:
    crash_idx = np.where(
        np.sqrt(x_pos**2 + (y_pos - global_vars["earth_moon_distance"]) ** 2)
        <= global_vars["radius_moon"],
        np.where(x_pos),
        -1,
    )
    crash_idx = crash_idx[crash_idx != -1]
    return None if np.size(crash_idx) <= 1 else crash_idx[1] + 1


def get_all_ks(
    global_vars: dict,
    variables_1: np.ndarray,
    variables_2: np.ndarray,
    is_moon: bool,
    bodies: int,
    moon_mass: float,
) -> tuple:
    """TODO: Docstring for get_all_ks.

    :: TODO
    :returns: TODO

    """
    if bodies == 1:
        k1 = np.array(get_initial_ks_1body(global_vars, variables_1, is_moon))
        k2 = np.array(
            get_initial_ks_1body(
                global_vars, variables_1 + global_vars["step_size"] * k1 / 2, is_moon
            )
        )
        k3 = np.array(
            get_initial_ks_1body(
                global_vars, variables_1 + global_vars["step_size"] * k2 / 2, is_moon
            )
        )
        k4 = np.array(
            get_initial_ks_1body(
                global_vars, variables_1 + global_vars["step_size"] * k3, is_moon
            )
        )
    else:
        k1 = np.array(
            get_initial_ks_2body(
                global_vars, variables_1, variables_2, is_moon, moon_mass
            )
        )
        k2 = np.array(
            get_initial_ks_2body(
                global_vars, variables_1, variables_2, is_moon, moon_mass
            )
        )
        k3 = np.array(
            get_initial_ks_2body(
                global_vars, variables_1, variables_2, is_moon, moon_mass
            )
        )
        k4 = np.array(
            get_initial_ks_2body(
                global_vars, variables_1, variables_2, is_moon, moon_mass
            )
        )
    return k1, k2, k3, k4


def populate_rk4_2body(
    global_vars: dict,
    earth_start: np.ndarray,
    moon_start: np.ndarray,
    max_time: int,
    moon_mass: float,
) -> tuple:
    """TODO: Docstring for populate_rk4.

    :variables: TODO

    :returns: TODO

    """
    t = np.arange(0, max_time, global_vars["step_size"])
    x_pos_earth, y_pos_earth = np.zeros_like(t, dtype=np.float_), np.zeros_like(
        t, dtype=np.float_
    )
    x_vel_earth, y_vel_earth = np.zeros_like(t), np.zeros_like(t)
    x_pos_moon, y_pos_moon = np.zeros_like(t, dtype=np.float_), np.zeros_like(
        t, dtype=np.float_
    )
    x_vel_moon, y_vel_moon = np.zeros_like(t), np.zeros_like(t)

    variables_1 = earth_start
    variables_2 = moon_start
    for idx in range(np.size(t)):
        x_pos_earth[idx], y_pos_earth[idx] = variables_1[0], variables_1[1]
        x_vel_earth[idx], y_vel_earth[idx] = variables_1[2], variables_1[3]

        k1, k2, k3, k4 = get_all_ks(
            global_vars, variables_1, variables_2, False, 2, moon_mass
        )
        variables_temp_earth = solve_rk4(global_vars, k1, k2, k3, k4, dc(variables_1))

        x_pos_moon[idx], y_pos_moon[idx] = variables_2[0], variables_2[1]
        x_vel_moon[idx], y_vel_moon[idx] = variables_2[2], variables_2[3]

        k1, k2, k3, k4 = get_all_ks(
            global_vars, variables_2, variables_1, True, 2, moon_mass
        )
        variables_temp_moon = solve_rk4(global_vars, k1, k2, k3, k4, dc(variables_2))

        variables_1 = dc(variables_temp_earth)
        variables_2 = dc(variables_temp_moon)
    return x_pos_earth, y_pos_earth, x_pos_moon, y_pos_moon


def populate_rk4_1body(
    global_vars: dict, variables: np.ndarray, max_time: int, is_moon: bool
) -> tuple:
    """TODO: Docstring for populate_rk4.

    :variables: TODO

    :returns: TODO

    """
    t = np.arange(0, max_time, global_vars["step_size"])
    x_pos, y_pos = np.zeros_like(t, dtype=np.float_), np.zeros_like(t, dtype=np.float_)
    x_vel, y_vel = np.zeros_like(t), np.zeros_like(t)
    for idx in range(np.size(t)):
        x_pos[idx], y_pos[idx] = variables[0], variables[1]
        x_vel[idx], y_vel[idx] = variables[2], variables[3]
        k1, k2, k3, k4 = get_all_ks(global_vars, variables, np.array([]), is_moon, 1, 0)
        variables_temp = solve_rk4(global_vars, k1, k2, k3, k4, dc(variables))
        variables = dc(variables_temp)
    return x_pos, y_pos, x_vel, y_vel


def check_energy_conservation(
    global_vars: dict,
    x_pos: np.ndarray,
    y_pos: np.ndarray,
    x_vel: np.ndarray,
    y_vel: np.ndarray,
    is_display: bool,
) -> float:
    """TODO: Docstring for check_energy_conservation.

    :global_vars: TODO
    :x_pos: TODO
    :y_pos: TODO
    :returns: TODO

    """
    energy_kin = 0.5 * (x_vel**2 + y_vel**2)
    energy_pot = -(global_vars["grav_constant"] * global_vars["mass_earth"]) / (
        x_pos**2 + y_pos**2
    ) ** (0.5)
    energy = energy_kin + energy_pot
    avg_energy = np.mean(energy)
    std_energy = np.std(energy)
    if is_display:
        print("-> Average energy per unit rocket mass:", avg_energy, "J/kg")
        print(
            "-> Standard deviation in energy per unit rocket mass:", std_energy, "J/kg"
        )
        print("-> Showing total energy at each timestep")
        input("* Press anything to continue...")
        plot_energies(energy_kin, energy_pot, energy)
    return float(std_energy)


##############################
#  PROBLEM 2 MAIN FUNCTIONS  #
##############################


######################
#  HELPER FUNCTIONS  #
######################


def take_input_int(var_name: str) -> int | str:
    """Take in a value as an input with error catching. These should be integers
    Except in the case where the input is empty, then use default value implemented
    in the parent function

    :param var_name: a string name for variable

    :returns: a positive integer

    """
    input_var = input(f"+ Enter a value for {var_name}: ")
    while True:
        if input_var == "":
            return input_var
        try:
            var = int(input_var)
            # assert var > 0
            break
        except Exception:
            input_var = input(f"! Please enter a valid value for {var_name}: ")
    return var


def take_input_complex(var_name: str) -> complex | str:
    """Take in a value as an input with error catching These should be complex
    Except in the case where the input is empty, then use default value implemented
    in the parent function

    :param var_name: a string name for variable
    :returns: the inputted variable

    """
    input_var = input(f"+ Enter a value for {var_name}: ")
    while True:
        if input_var == "":
            return input_var
        try:
            var = complex(input_var)
            break
        except ValueError:
            input_var = input(f"! Please enter a valid value for {var_name}: ")
    return var


def take_input_general(var_name: str) -> float | str:
    """Take in a value as an input with error catching These should be floats
    Except in the case where the input is empty, then use default value implemented
    in the parent function

    :param var_name: a string name for variable
    :returns: the inputted variable

    """
    input_var = input(f"+ Enter a value for {var_name}: ")
    while True:
        if input_var == "":
            return input_var
        try:
            var = float(input_var)
            break
        except ValueError:
            input_var = input(f"! Please enter a valid value for {var_name}: ")
    return var


def take_input_bool(var_name: str) -> bool | str:
    """Take in a value as an input with error catching These should be booleans
    Except in the case where the input is empty, then use default value implemented
    in the parent function

    :param var_name: a string name for variable
    :returns: the inputted variable

    """
    input_var = input(f"+ {var_name}: ")
    var = ""
    while True:
        if input_var == "":
            return input_var
        elif input_var == "True":
            var = True
            break
        elif input_var == "False":
            var = False
            break
        else:
            input_var = input(f"! Please enter a valid value for {var_name}: ")
            break
    return var


def round_with_decimal(decimal_places: int, value: float) -> float:
    """Round a float to the nearest dp provided without precision error
    using quantize() from Decimal class

    :param dp: number of decimal places
    :param value: the float to round
    :returns: the answer as a float

    """
    reference = "1." + "0" * decimal_places
    return float(Decimal(str(value)).quantize(Decimal(reference)))


def map_float_to_index(value: float, step: float, start: float) -> int:
    """Given the value convert it to an index

    :param value: the original value
    :param step: the stepsize
    :returns: the index

    """
    return int(round_with_decimal(0, (value - start) / step))


########################
#  PLOTTING FUNCTIONS  #
########################


def plot_energies(energy_kin, energy_pot, energy):
    plt.scatter(
        np.array([n for n in range(np.size(energy_kin))]),
        energy_kin,
        label="Kinetic energy",
    )
    plt.scatter(
        np.array([n for n in range(np.size(energy_pot))]),
        energy_pot,
        label="Potential energy",
    )
    plt.scatter(
        np.array([n for n in range(np.size(energy_pot))]), energy, label="Total energy"
    )
    plt.xlabel("Timestep index")
    plt.ylabel(r"Energy/$m_{rocket}$ (J/kg)")
    plt.legend()
    plt.show()
    plt.clf()
    plt.cla()
    plt.close()


def animate_orbit_2body(
    global_vars: dict,
    x_pos_earth: np.ndarray,
    y_pos_earth: np.ndarray,
    x_pos_moon: np.ndarray,
    y_pos_moon: np.ndarray,
    filename: str,
    # mass_ratio: float,
):
    """

    :param x_pos: errors array
    :param y_pos: results array
    :param filename: TODO
    :return:

    """
    fig, ax = plt.subplots(figsize=(9, 9))

    ani_scale = int(
        take_input_int("animation scale (square of inputted value) (default: 0)") or "0"
    )

    def animate(i):
        ax.clear()  # type: ignore
        x1, y1 = x_pos_earth[:i], y_pos_earth[:i]
        x2, y2 = x_pos_moon[:i], y_pos_moon[:i]
        ax.plot(x1, y1, color="blue", lw=2, alpha=1)  # type: ignore
        ax.plot(x2, y2, color="olive", lw=2, alpha=1)  # type: ignore
        patches = [
            plt.Circle(
                (x_pos_earth[i], y_pos_earth[i]), radius=1, color="blue", edgecolor=None
            ),
            plt.Circle(
                (x_pos_moon[i], y_pos_moon[i]), radius=1, color="olive", edgecolor=None
            ),
        ]

        collection = clt.PatchCollection(patches, match_original=True)
        ax.add_collection(collection)  # type: ignore
        ax.set_xlim([-1.1 * ani_scale, ani_scale * 1.1])  # type: ignore
        ax.set_ylim([-1.1 * ani_scale, ani_scale * 1.1])  # type: ignore
        ax.set_xlabel(r"x distance ($R_E$)")  # type: ignore
        ax.set_ylabel(r"y distance ($R_E$)")  # type: ignore

    ani = anim.FuncAnimation(fig, animate, frames=len(x_pos_earth) - 1, interval=1)
    plt.show()
    is_save = bool(
        take_input_bool("Do you want to save a gif? Enter True/False (default: False)")
        or False
    )
    if is_save:
        print("-> Saving gif...")
        writergif = anim.PillowWriter(fps=30)
        ani.save(f"{filename}.gif", writer=writergif)


def animate_orbit_1body(
    global_vars: dict,
    x_pos: np.ndarray,
    y_pos: np.ndarray,
    filename: str,
    is_moon: bool,
):
    """

    :param x_pos: errors array
    :param y_pos: results array
    :param filename: TODO
    :return:

    """
    fig, ax = plt.subplots(figsize=(9, 9))

    xmax = np.max([np.abs(np.min(x_pos)), np.max(x_pos)])
    ymax = np.max([np.abs(np.min(y_pos)), np.max(y_pos)])
    ani_scale = np.max([xmax, ymax])
    earth = plt.Circle((0, 0), radius=1, color="blue", edgecolor=None)

    def animate(i):
        ax.clear()  # type: ignore
        x, y = x_pos[:i], y_pos[:i]
        ax.plot(x, y, color="lightsteelblue", lw=2, alpha=0.8)  # type: ignore
        ax.plot(x_pos[i], y_pos[i], color="lightsteelblue", marker="o", ms=10)  # type: ignore
        ax.set_xlim([-1.1 * ani_scale, ani_scale * 1.1])  # type: ignore
        ax.set_ylim([-1.1 * ani_scale, ani_scale * 1.1])  # type: ignore
        ax.set_xlabel(r"x distance ($R_E$)")  # type: ignore
        ax.set_ylabel(r"y distance ($R_E$)")  # type: ignore
        ax.add_patch(earth)  # type: ignore
        if is_moon:
            moon = plt.Circle(
                (0, global_vars["earth_moon_distance"] / global_vars["radius_earth"]),
                radius=(global_vars["radius_moon"] / global_vars["radius_earth"]),
                color="olive",
                edgecolor=None,
            )
            ax.add_patch(moon)  # type: ignore

    ani = anim.FuncAnimation(fig, animate, frames=len(x_pos) - 1, interval=1)
    plt.show()
    is_save = bool(
        take_input_bool("Do you want to save a gif? Enter True/False (default: False)")
        or False
    )
    if is_save:
        print("-> Saving gif...")
        writergif = anim.PillowWriter(fps=30)
        ani.save(f"{filename}.gif", writer=writergif)


def plot_overview_orbit(
    global_vars: dict, x_pos: np.ndarray, y_pos: np.ndarray, is_moon: bool
):
    """TODO: Docstring for plot_overview_orbit.

    :x_pos: TODO
    :y_pos: TODO
    :returns: TODO

    """
    earth = plt.Circle((0, 0), radius=1, color="blue", edgecolor=None)
    fig, ax = plt.subplots(figsize=(9, 9))
    xmax = np.max([np.abs(np.min(x_pos)), np.max(x_pos)])
    ymax = np.max([np.abs(np.min(y_pos)), np.max(y_pos)])
    ani_scale = np.max([xmax, ymax])
    # plt.rcParams["figure.figsize"] = (9, 9)
    ax.set_xlabel(r"x distance ($R_E$)")  # type: ignore
    ax.set_ylabel(r"y distance ($R_E$)")  # type: ignore
    ax.set_xlim([-1.1 * ani_scale, ani_scale * 1.1])  # type: ignore
    ax.set_ylim([-1.1 * ani_scale, ani_scale * 1.1])  # type: ignore
    ax.plot( x_pos, y_pos,)  # type: ignore
    ax.add_patch(earth)  # type: ignore
    if is_moon:
        moon = plt.Circle(
            (0, global_vars["earth_moon_distance"] / global_vars["radius_earth"]),
            radius=(global_vars["radius_moon"] / global_vars["radius_earth"]),
            color="olive",
            edgecolor=None,
        )
        ax.add_patch(moon)  # type: ignore
    plt.show()
    # plt.rcParams["figure.figsize"] = plt.rcParamsDefault["figure.figsize"]


##########
#  MAIN  #
##########


def main():
    """Driver code"""
    user_input = "0"
    global_vars = {
        "grav_constant": 6.67e-11,
        "mass_earth": 5.97e24,
        "mass_moon": 7.34e22,
        "radius_earth": 6.38e6,
        "radius_moon": 1.74e6,
        "step_size": 40,
        "earth_moon_distance": 3.84e8,
    }
    # plt.rcParams.update({"font.size": 20})  # Uncomment for bigger plot fonts (for report only)
    while user_input != "q":
        print(
            "---------------------------------------------------------"
            "\n(a) 1D diffraction: compare Simpsons & quadrature",
            "\n(b) 1D diffraction: explore parameters & near-field",
            "\n(c) 2D diffraction: square/rectangular aperture",
            "\n(d) 2D diffraction: circular aperture",
            "\n(e) Monte Carlo: estimate pi & error",
            "\n(f) Monte Carlo: results & errors vs N (2D)",
            "\n(g) Monte Carlo results & errors vs N (2D-10D)",
            "\n(h) Pseudorandom vs quasirandom Monte Carlo (extension)",
            "\n---------------------------------------------------------",
        )
        user_input = input(
            '+ Enter a choice, "a", "b", "c", "d", "e", "f", "g", "h", or "q" to quit: '
        )
        print("-> You entered the choice:", user_input)
        if user_input == "a":
            run_option_a(dc(global_vars))
        elif user_input == "b":
            run_option_b(dc(global_vars))
        elif user_input == "c":
            run_option_c(dc(global_vars))
        elif user_input == "d":
            run_option_d(dc(global_vars))
        elif user_input != "q":
            print("! This is not a valid choice.")
    print("-> You have chosen to finish - goodbye.")


if __name__ == "__main__":
    main()
