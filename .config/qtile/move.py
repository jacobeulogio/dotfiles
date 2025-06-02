def swap_screen(qtile):
    i = qtile.screens.index(qtile.current_screen)
    if i == 0:
        qtile.current_group.toscreen(1)
    else:
        qtile.current_group.toscreen(0)


def window_to_left(qtile, switch_group=False, switch_screen=False):
    current_screen = qtile.current_screen
    current_window = qtile.current_window

    if current_window is None:
        return

    i = qtile.screens.index(qtile.current_screen)
    leftest_point = current_screen.info()["x"]
    if current_window["x"] > leftest_point:
        qtile.current_layout.shuffle_left()

    elif i + 1 != 0:
        first_screen_position = qtile.screens[0].info()["x"]
        second_screen_position = qtile.screens[1].info()["x"]
        # Check Screen Positions
        target_index_diff = 1 if second_screen_position < first_screen_position else -1
        group = qtile.screens[i + target_index_diff].group.name

        qtile.current_window.togroup(group, switch_group=switch_group)
        if switch_screen:
            qtile.cmd_to_screen(i + target_index_diff)


def window_to_right(qtile, switch_group=False, switch_screen=False):
    current_screen = qtile.current_screen
    current_window = qtile.current_window

    if current_window is None:
        return

    screens_by_position = sorted(qtile.screens, key=lambda s: s.x)
    screen_index = screens_by_position.index(current_screen)

    window_info = current_window.info()
    screen_info = current_screen.info()
    right_edge = screen_info["x"] + screen_info["width"]

    if window_info["x"] + window_info["width"] < right_edge - 60:
        qtile.current_layout.shuffle_right()

    elif screen_index + 1 < len(screens_by_position):
        target_screen = screens_by_position[screen_index + 1]
        target_group = target_screen.group.name

        current_window.togroup(target_group, switch_group=switch_group)
        if switch_screen:
            target_screen_index = qtile.screens.index(target_screen)
            qtile.cmd_to_screen(target_screen_index)
