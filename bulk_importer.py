
import os
import glob
import shutil
import jinja2
from jinja2 import FileSystemLoader, Environment, select_autoescape
import tempfile

from path import Path

from subprocess import call



alterations = {
    "as_domains.sql": {"variable": "as_domain_id"},
    "bgc_rules.sql":  {"variable": "bgc_rule_id"},
    "biosynthetic_gene_clusters.sql" : {"variable": "bgc_id"},
    "cdss.sql" : {"variable": "cds_id"},
    "clusterblast_hits.sql" : {"variable": "cluserblast_hit_id"},
    "compounds.sql" : {"variable": "compound_id"},
    "dna_sequences.sql" : {"variable": "sequence_id"},
    "genes.sql" : {"variable": "gene_id"},
    "genomes.sql" : {"variable": "genome_id"},
    "isolates.sql" : {"variable": "isolate_id"},
    "loci.sql" : {"variable": "locus_id"},
    "operons.sql" : {"variable": "operon_id"},
    "pfam_domains.sql" : {"variable": "pfam_domain_id"},
    "profile_hits.sql" : {"variable": "profile_hit_id"},
    "samples.sql" : {"variable": "sample_id"},
    "sampling_sites.sql" : {"variable": "site_id"},
    "smcog_hits.sql" : {"variable": "smcog_id"}
}




FILE_DIR = os.path.realpath(__file__)
templates = FileSystemLoader('{}/templates'.format(FILE_DIR), followlinks=True)

## "variable"s
# DATABASE
# PSQL_HOST={{PSQL_HOST}}
# PSQL_PORT={{PSQL_PORT}}
# PSQL_USER={{PSQL_USER}}
# PSQL_DB={{PSQL_DB}}
# PSQL_SCHEMA={{PSQL_SCHEMA}}
# ALTER_RULE = "ALTER SEQUENCE payments_id_seq RESTART WITH 22;"

# def setup_temp_dir():
#     """ Create a Temporary directory with the following subfolders:
#             1. templates
#             2. gbks
#             3. outputs
#     """

with tempfile.TemporaryDirectory() as tmpdirname:

    template_tmpdir  = "{}/templates".format(tmpdirname)
    gbk_tmpdir       = "{}/gbks".format(tmpdirname)
    output_tmpdir    = "{}/outputs".format(tmpdirname)

    for directory in [template_tmpdir, gbk_tmpdir, output_tmpdir]:
        try:
            os.mkdir(directory)
        except:
            pass

    env = Environment(
        loader=FileSystemLoader('./templates'),
        autoescape=select_autoescape(['html', 'xml','sql'])
    ) 

    # write out templates
    for template_file in env.list_templates():
        template = env.get_template(template_file)

        with open("{}/{}".format(template_tmpdir, os.path.basename(template_file)), 'w') as f:
            rendered_content = template.render(
                PSQL_HOST="localhost",
                PSQL_PORT=5432,
                PSQL_USER="postgres",
                PSQL_DB="antismash1",
                PSQL_SCHEMA="antismash1",
                DATABASE="antismash1"
            )
            f.write(rendered_content)
        
    # write out gbks
    gbkdir = "gbkfiles"
    for gbk in glob.glob("{}/*gbk".format(gbkdir)):
        shutil.copy(gbk, "{}/{}".format(gbk_tmpdir, os.path.basename(gbk)))


    # initialize the DB
    with Path(template_tmpdir):
        print(os.listdir())
        call(["bash", "init_database.sh"])


    # create outputs

...     


# class BulkProcessor():
#     __init__(self, gbkdir, dbdir, db_processors = 1):
#         self.gbkdir = gbkdir
#         self.dbdir = dbdir
#         self.db_processors = db_processors
    
    


