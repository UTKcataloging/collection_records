SCHEMAS="test_schemas/schemas.xsd"
COLLECTION_RECORDS="../collection_records"


testShunitIntalled() {
    assertNotNull $(which shunit2)
}

testIfCollectionRecordsValid() {
    for filename in $COLLECTION_RECORDS/*.xml; do
        RESPONSE=$(xmllint --noout --schema ${SCHEMAS} ${filename} 2>&1 1>/dev/null | cat)
        assertEquals "${RESPONSE}" "${filename} validates"
    done
}

. shunit2