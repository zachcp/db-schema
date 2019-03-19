#!/bin/bash

set -o errexit
set -o nounset

ASDB_REINIT={{ASDB_REINIT}}
PSQL_HOST={{PSQL_HOST}}
PSQL_PORT={{PSQL_PORT}}
PSQL_USER={{PSQL_USER}}
PSQL_DB={{PSQL_DB}}
PSQL_SCHEMA={{PSQL_SCHEMA}}

PSQL="psql -h $PSQL_HOST -p $PSQL_PORT -U $PSQL_USER"
PSQL_AS="$PSQL $PSQL_DB"

$PSQL -tc "SELECT 1 FROM pg_database WHERE datname = '${PSQL_DB}';" | grep -q 1 || $PSQL -c "CREATE DATABASE $PSQL_DB;"

if [ -n "$ASDB_REINIT" ]; then
    echo "Clearing out the whole schema"
    $PSQL_AS -c "DROP SCHEMA IF EXISTS ${PSQL_SCHEMA} CASCADE;"
fi

$PSQL_AS -c "CREATE SCHEMA IF NOT EXISTS ${PSQL_SCHEMA};"

# tables not depending on other tables
TABLES="sampling_sites evidences bgc_types compounds monomers taxa profiles as_domain_profiles terpenes"
# tables depending on other tables. Please keep the order intact
TABLES="$TABLES bgc_rules samples isolates genomes dna_sequences loci operons "
TABLES="$TABLES functional_classes smcogs cdss genes biosynthetic_gene_clusters"
TABLES="$TABLES as_domains clusterblast_algorithms clusterblast_hits tta_codons"
TABLES="$TABLES pfams pfam_domains"
# tables that create many-to-many relations
TABLES="$TABLES rel_clusters_types rel_clusters_compounds rel_compounds_monomers"
TABLES="$TABLES rel_as_domains_monomers smcog_hits profile_hits terpene_cyclisations"
# views that depend on all this stuff
TABLES="$TABLES view_cds_cluster_map view_sequence_gc_content view_sequence_lengths"
# precalculated data, load this last
TABLES="$TABLES preload_taxa"

for t in $TABLES; do
    echo "Processing $t"
    $PSQL_AS < "${t}.sql"
done
