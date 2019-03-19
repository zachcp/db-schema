CREATE MATERIALIZED VIEW "{{DATABASE}}"."sequence_lengths" AS SELECT sequence_id, length(dna) AS seq_length FROM "{{DATABASE}}"."dna_sequences";
