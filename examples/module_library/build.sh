#!/bin/bash
# build.sh - Script to combine multiple USE files into a single model file
# Usage: ./build.sh

# Define directories and files
MODEL_NAME="Library"
OUTPUT_FILE="main.use"
CLASSES_DIR="classes"
ASSOCIATIONS_DIR="associations"
CONSTRAINTS_DIR="constraints"

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
echo "Run USE tool with: java -jar use.jar $OUTPUT_FILE"
