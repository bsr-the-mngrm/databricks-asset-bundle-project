# Example Databricks notebook
# Purpose: demonstrate how notebooks orchestrate logic from src/

from my_project.transforms.example import example_transform


def run():
    df = example_transform()
    display(df)


if __name__ == "__main__":
    run()
