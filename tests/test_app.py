# tests/test_app.py

import pytest

from my_project.app import greet


def test_greet_valid_name():
    # SETUP
    name = "Alice"

    # ACTION
    result = greet(name)

    # ASSERTION
    expected = "Hello, Alice!"
    if result != expected:
        pytest.fail(f"Expected '{expected}', got '{result}'")


def test_greet_empty_name():
    with pytest.raises(ValueError):
        greet("")
