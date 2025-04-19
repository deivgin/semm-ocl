#!/bin/bash
# build.sh - Script to combine multiple USE files into a single model file

# Define directories and files
MODEL_NAME="Untangle"
OUTPUT_FILE="src/main.use"
CLASSES_DIR="src/classes"
ASSOCIATIONS_DIR="src/associations"
CONSTRAINTS_DIR="src/constraints"

# Create the output file with model header
echo "model $MODEL_NAME" > $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

# Add separator and classes
echo "-- ==============================" >> $OUTPUT_FILE
echo "-- CLASSES" >> $OUTPUT_FILE
echo "-- ==============================" >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

# Add each class file
if [ -d "$CLASSES_DIR" ]; then
  for file in $CLASSES_DIR/*.use; do
    if [ -f "$file" ]; then
      echo "Adding class from $file"
      cat "$file" >> $OUTPUT_FILE
      echo "" >> $OUTPUT_FILE
    fi
  done
fi

# Add separator and associations
echo "-- ==============================" >> $OUTPUT_FILE
echo "-- ASSOCIATIONS" >> $OUTPUT_FILE
echo "-- ==============================" >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

# Add each association file
if [ -d "$ASSOCIATIONS_DIR" ]; then
  for file in $ASSOCIATIONS_DIR/*.use; do
    if [ -f "$file" ]; then
      echo "Adding associations from $file"
      cat "$file" >> $OUTPUT_FILE
      echo "" >> $OUTPUT_FILE
    fi
  done
fi

# Add separator and constraints
echo "-- ==============================" >> $OUTPUT_FILE
echo "-- CONSTRAINTS" >> $OUTPUT_FILE
echo "-- ==============================" >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE
echo "constraints" >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

# Add each constraint file
if [ -d "$CONSTRAINTS_DIR" ]; then
  for file in $CONSTRAINTS_DIR/*.use; do
    if [ -f "$file" ]; then
      echo "Adding constraints from $file"
      cat "$file" >> $OUTPUT_FILE
      echo "" >> $OUTPUT_FILE
    fi
  done
fi

echo "Model file $OUTPUT_FILE successfully created."
