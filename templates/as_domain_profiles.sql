CREATE TABLE "{{DATABASE}}"."as_domain_profiles" (
    as_domain_profile_id	serial NOT NULL,
    name	text,
    description	text,
    database	text,
    CONSTRAINT as_domain_profiles_pkey PRIMARY KEY (as_domain_profile_id)
);

COMMENT ON TABLE antismash.as_domain_profiles IS
  'A functional secondary metabolite domain profile predicted by antiSMASH';

INSERT INTO "{{DATABASE}}"."as_domain_profiles" (name, description, database)
VALUES
    ('Condensation', 'Condensation domain', 'nrpspksdomains.hmm'),
    ('Condensation_DCL', 'Condensation domain that links L-amino acid to peptide ending with D-amino acid', 'nrpspksdomains.hmm'),
    ('Condensation_LCL', 'Condensation domain that links L-amino acid to peptide ending with L-amino acid', 'nrpspksdomains.hmm'),
    ('Condensation_Dual', 'Dual condensation/epimerization domain', 'nrpspksdomains.hmm'),
    ('Condensation_Starter', 'Starter condensation domain', 'nrpspksdomains.hmm'),
    ('X', 'Putative inactive glycopeptide condensation-like domain', 'nrpspksdomains.hmm'),
    ('Cglyc', 'Glycopeptide condensation domain', 'nrpspksdomains.hmm'),
    ('Heterocyclization', 'Heterocyclization domain', 'nrpspksdomains.hmm'),
    ('Epimerization', 'Epimerization domain', 'nrpspksdomains.hmm'),
    ('ACPS', '4''-phosphopantetheinyl transferase', 'nrpspksdomains.hmm'),
    ('MT', 'methyl transferase', 'nrpspksdomains.hmm'),
    ('cMT', 'C-methyl transferase', 'nrpspksdomains.hmm'),
    ('oMT', 'O-methyl transferase', 'nrpspksdomains.hmm'),
    ('nMT', 'N-methyl transferase', 'nrpspksdomains.hmm'),
    ('AMP-binding', 'Adenylation domain', 'nrpspksdomains.hmm'),
    ('A-OX', 'Adenylation domain with integrated oxidase', 'nrpspksdomains.hmm'),
    ('Thioesterase', 'Thioesterase domain', 'nrpspksdomains.hmm'),
    ('TD', 'Terminal reductase domain', 'nrpspksdomains.hmm'),
    ('Aminotran_1_2', 'Aminotransferase class I + II', 'nrpspksdomains.hmm'),
    ('Aminotran_3', 'Aminotransferase class III', 'nrpspksdomains.hmm'),
    ('Aminotran_4', 'Aminotransferase class IV', 'nrpspksdomains.hmm'),
    ('Aminotran_5', 'Aminotransferase class V', 'nrpspksdomains.hmm'),
    ('PKS_KS', 'Ketosynthase domain', 'nrpspksdomains.hmm'),
    ('PKS_KR', 'Ketoreductase domain', 'nrpspksdomains.hmm'),
    ('PKS_ER', 'Enoylreductase domain', 'nrpspksdomains.hmm'),
    ('PKS_DH', 'Dehydrogenase domain', 'nrpspksdomains.hmm'),
    ('PKS_DH2', 'Dehydrogenase-2 domain', 'nrpspksdomains.hmm'),
    ('PKS_DHt', 'Inactive truncated dehydrogenase domain', 'nrpspksdomains.hmm'),
    ('PKS_AT', 'Acyltransferase domain', 'nrpspksdomains.hmm'),
    ('NRPS-COM_Nterm', 'NRPS COM domain N-terminal', 'nrpspksdomains.hmm'),
    ('NRPS-COM_Cterm', 'NRPS COM domain C-terminal', 'nrpspksdomains.hmm'),
    ('Polyketide_cyc', 'Polyketide cyclase', 'nrpspksdomains.hmm'),
    ('Polyketide_cyc2', 'Polyketide cyclase/dehydratase', 'nrpspksdomains.hmm'),
    ('PKS_Docking_Nterm', 'PKS N-terminal docking domain', 'nrpspksdomains.hmm'),
    ('PKS_Docking_Cterm', 'PKS C-terminal docking domain', 'nrpspksdomains.hmm'),
    ('CAL_domain', 'Co-enzyme A ligase domain', 'nrpspksdomains.hmm'),
    ('Trans-AT_docking', 'Trans-acyltransferase docking domain', 'nrpspksdomains.hmm'),
    ('ACP', 'Acyl-carrier protein domain', 'nrpspksdomains.hmm'),
    ('PCP', 'Peptidyl-carrier protein domain', 'nrpspksdomains.hmm'),
    ('NAD_binding_4', NULL, 'nrpspksdomains.hmm'),
    ('ACP_beta', 'beta-branching acyl-carrier protein domain', 'nrpspksdomains.hmm'),
    ('B', 'branching domain', 'nrpspksdomains.hmm'),
    ('F', 'Formylation domain', 'nrpspksdomains.hmm'),
    ('FkbH', 'FkbH-like domain', 'nrpspksdomains.hmm'),
    ('GNAT', 'GNAT domain', 'nrpspksdomains.hmm'),
    ('Hal', 'Halogenase domain', 'nrpspksdomains.hmm'),
    ('PS', 'Pyran synthase domain', 'nrpspksdomains.hmm'),
    ('ECH', NULL, 'nrpspksdomains.hmm');


{{ALTER_STATEMENT}}
