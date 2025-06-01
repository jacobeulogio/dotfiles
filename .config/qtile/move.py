def swap_screen(qtile):
    i = qtile.screens.index(qtile.current_screen)
    if i == 0:
        qtile.current_group.toscreen(1)
    else:
        qtile.current_group.toscreen(0)


def window_to_left(qtile, switch_group=False, switch_screen=False):
    i = qtile.screens.index(qtile.current_screen)
    leftest_point = qtile.current_screen.info()["x"]
    if qtile.current_window.get_position()[0] > leftest_point:
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
    i = qtile.screens.index(qtile.current_screen)
    rightest_point = qtile.current_screen.info()["width"] + qtile.current_screen.info()["x"]
    if qtile.current_window.get_position()[0] + qtile.current_window.get_size()[0] < rightest_point - 60:
        qtile.current_layout.shuffle_right()

    elif i + 1 != len(qtile.screens):
        first_screen_position = qtile.screens[0].info()["x"]
        second_screen_position = qtile.screens[1].info()["x"]
        # Check Screen Positions
        target_index_diff = -1 if second_screen_position < first_screen_position else 1
        group = qtile.screens[i + target_index_diff].group.name

        qtile.current_window.togroup(group, switch_group=switch_group)
        if switch_screen:
            qtile.cmd_to_screen(i + target_index_diff)
