"""This module contains a simple function to greet a user by name."""


def greet(name: str) -> str:
    """Returns a greeting message."""
    if not name:
        raise ValueError("Name must be a non-empty string.")
    return f"Hello, {name}!"
