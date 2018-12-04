---
layout: default
title: Home
version: v0.1
latest: true
---

This workflow can be used to collect a variety of metrics from a BAM file.
Metrics are collected using picard and samtools.

This workflow is part of [BioWDL](https://biowdl.github.io/)
developed by [the SASC team](http://sasc.lumc.nl/).

## Usage
This workflow can be run using
[Cromwell](http://cromwell.readthedocs.io/en/stable/):
```bash
java -jar cromwell-<version>.jar run -i inputs.json bammetrics.wdl
```

### Inputs
Inputs are provided through a JSON file. The minimally required inputs are
described below and a template containing all possible inputs can be generated
using Womtool as described in the
[WOMtool documentation](http://cromwell.readthedocs.io/en/stable/WOMtool/).
See [this page](/inputs.html) for some additional general notes and information
about pipeline inputs.

```json
{
  "BamMetrics.reference": {
    "fasta": "The path to the reference fasta file",
    "fai": "The path to the index for the reference fasta",
    "dict": "The path to the dict file for the reference fasta"
  },
  "BamMetrics.outputDir": "The path to the output directory",
  "BamMetrics.bam": {
    "file": "A path to an input BAM file",
    "index": "The path to the index for the ipnut BAM file"
  }
}
```

In the case of RNAseq samples tho following inputs are also required. By
providing these inputs additional RNAseq metrics will be collected.
```json
{
  "BamMetrics.refRefflat": "A path to a Refflat annotation file for the reference",
  "BamMetrics.strandedness": "The strandedness of an RNAseq sample. This should be on of 'None', 'FR' (forward-reverse) or 'RF' (reverse-forward), defaults to 'None'"
}
```

For targeted sequencing samples the following inputs are also required. By
providing these inputs additional targeted PCR metrics will be collected.
```json
{
  "BamMetrics.targetIntervals": "A list of paths to the bed files containing the target regions",
  "BamMetrics.ampliconIntervals": "The path to the bed file containing the amplicon regions"
}
```

#### Example
```json
{
  "BamMetrics.reference": {
    "fasta": "/home/user/genomes/human/GRCh38.fasta",
    "fai": "/home/user/genomes/human/GRCh38.fasta.fai",
    "dict": "/home/user/genomes/human/GRCh38.dict"
  },
  "BamMetrics.outputDir": "/home/user/analysis/metrics",
  "BamMetrics.bam": {
    "file": "/home/user/mapping/results/s1.bam",
    "index": "/home/user/mapping/results/s1.bai"
  },
  "BamMetrics.targetIntervals": [
    "/home/user/analysis/target1.bed",
    "/home/user/analysis/target2.bed"
  ],
  "BamMetrics.ampliconIntervals": "/home/user/analysis/amplicon.bed"
}
```

### Dependency requirements and tool versions
Included in the repository is an `environment.yml` file. This file includes
all the tool version on which the workflow was tested. You can use conda and
this file to create an environment with all the correct tools.

### Output
A directory containing the various metrics collected.

## Contact
<p>
  <!-- Obscure e-mail address for spammers -->
For any questions about running this workflow and feature requests, please use
the
<a href='https://github.com/biowdl/bammetrics/issues'>github issue tracker</a>
or contact
<a href='http://sasc.lumc.nl/'>the SASC team</a> directly at: <a href='&#109;&#97;&#105;&#108;&#116;&#111;&#58;&#115;&#97;&#115;&#99;&#64;&#108;&#117;&#109;&#99;&#46;&#110;&#108;'>
&#115;&#97;&#115;&#99;&#64;&#108;&#117;&#109;&#99;&#46;&#110;&#108;</a>.
</p>
