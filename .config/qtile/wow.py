def move_window_to_adjacent_screen(qtile, direction="left", switch_group=False, switch_screen=False, edge_offset=60):
    """
    Move the current window to the adjacent screen in the specified direction or shuffle within the layout.

    Args:
        qtile: The Qtile instance.
        direction (str): Direction to move the window ("left" or "right"). Default is "left".
        switch_group (bool): If True, switch to the target group after moving the window. Default is False.
        switch_screen (bool): If True, switch to the target screen after moving the window. Default is False.
        edge_offset (int): Pixel offset from the screen edge to consider the window "at the edge". Default is 60.

    Returns:
        None
    """
    if not qtile.current_window or not qtile.current_screen:
        return  # Exit if no window or screen is active

    # Get current screen index and info
    current_index = qtile.screens.index(qtile.current_screen)
    screen_info = qtile.current_screen.info()
    window_x, _ = qtile.current_window.get_position()
    window_width, _ = qtile.current_window.get_size()

    # Define movement parameters based on direction
    is_left = direction.lower() == "left"
    shuffle_method = qtile.current_layout.shuffle_left if is_left else qtile.current_layout.shuffle_right
    edge_position = screen_info["x"] if is_left else screen_info["x"] + screen_info["width"] - edge_offset
    window_at_edge = window_x <= screen_info["x"] if is_left else window_x + window_width >= edge_position - edge_offset

    # Shuffle within layout if window is not at the screen edge
    if not window_at_edge:
        shuffle_method()
        return

    # Check if there's an adjacent screen
    target_index = current_index - 1 if is_left else current_index + 1
    if not (0 <= target_index < len(qtile.screens)):
        return  # No adjacent screen in the desired direction

    # Find the target screen by sorting screens by x-coordinate
    screens = sorted(qtile.screens, key=lambda s: s.info()["x"])
    current_x = screen_info["x"]
    target_screen = None
    for screen in screens:
        screen_x = screen.info()["x"]
        if (is_left and screen_x < current_x) or (not is_left and screen_x > current_x):
            target_screen = screen
            break

    if not target_screen:
        return  # No suitable adjacent screen found

    # Move window to the target screen's group
    target_group = target_screen.group.name
    qtile.current_window.togroup(target_group, switch_group=switch_group)

    # Switch to the target screen if requested
    if switch_screen:
        qtile.cmd_to_screen(qtile.screens.index(target_screen))


# Convenience functions for key bindings
def window_to_left(qtile, switch_group=False, switch_screen=False):
    move_window_to_adjacent_screen(qtile, direction="left", switch_group=switch_group, switch_screen=switch_screen)


def window_to_right(qtile, switch_group=False, switch_screen=False):
    move_window_to_adjacent_screen(qtile, direction="right", switch_group=switch_group, switch_screen=switch_screen)
