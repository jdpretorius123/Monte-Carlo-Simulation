# A library for EHR utilities

## Modules
ehr_utils - allows the user to perform basic operations
on EHR data. This tool accepts tab-delimited text (.txt) files.

## Usage
This script requires `datetime`, and contains the following
functions.

## Functions
* remove_chars - trims BOMs from .txt files
* condition - returns sorting criteria for patient laboratory test history
* parse_data - returns parsed data for patients and their corresponding laboratory test history
* patient_age - verifies patient age
* patient_is_sick - verifies history of patient illness

## Example Usage
```
from datetime import *

records = parse_data("patient_file.txt", "patient_labs_file.txt")

age = patient_age(records, patient_ID)

was_patient_sick = patient_is_sick(
records,
patient_ID,
lab_name,
operator,
value)
```

## Development
We welcome contributions! Before opening a pull request, please confirm that existing tests pass.

```
python -m pytest tests/
```
