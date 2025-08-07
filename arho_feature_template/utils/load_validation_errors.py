import csv
import os

PLUGIN_PATH = os.path.dirname(os.path.dirname(__file__))
FILE_PATH = os.path.join(PLUGIN_PATH, "resources", "configs", "validointisaantojen_paluuarvot.csv")


def load_validation_errors():
    errors = {}
    with open(FILE_PATH) as file:
        reader = csv.reader(file)
        next(reader)
        for row in reader:
            errors[row[1]] = row[2]  # ID as key, description as value
    return errors


VALIDATION_ERRORS = load_validation_errors()
