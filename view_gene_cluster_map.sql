CREATE MATERIALIZED VIEW antismash.gene_cluster_map AS
SELECT sequence_id, bgc_id, gene_id FROM (
    SELECT
        gene_id, start_pos, end_pos, seq.sequence_id
    FROM antismash.genes g
    JOIN antismash.loci l ON g.locus = l.locus_id
    JOIN antismash.dna_sequences seq USING (sequence_id)
    ORDER BY
    gene_id
) e1
LEFT JOIN LATERAL (
    SELECT
        bgc_id
    FROM antismash.biosynthetic_gene_clusters bgc
    JOIN antismash.loci l ON bgc.locus = l.locus_id
    JOIN antismash.dna_sequences seq USING (sequence_id)
    WHERE
        seq.sequence_id = e1.sequence_id AND
        int4range(l.start_pos, l.end_pos) @> int4range(e1.start_pos, e1.end_pos)
) e2 ON true
WHERE
    bgc_id IS NOT NULL;
