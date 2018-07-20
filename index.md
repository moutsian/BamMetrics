---
layout: default
title: Home
version: develop
latest: true
---

This workflow can be used to collect a variety of metrics from a BAM file.
Metrics are collected using picard and samtools.

## Usage
`bammetrics.wdl` can be run using
[Cromwell](http://cromwell.readthedocs.io/en/stable/):

```
java -jar cromwell-<version>.jar run -i inputs.json bammetrics.wdl
```

The inputs JSON can be generated using WOMtools as described in the [WOMtools
documentation](http://cromwell.readthedocs.io/en/stable/WOMtool/).

The primary inputs are described below, additional inputs (such as precommands
and JAR paths) are available. Please use the above mentioned WOMtools command
to see all available inputs.

| field | type | default | |
|-|-|-|-|
| bamFile | `File` | | The BAM file for which metrics will be collected. |
| bamIndex | `File` | | The index if the input BAM file. |
| outputDir | `String` | | The directory in which the output will be placed. |
| refFasta | `File` | | The reference fasta file. |
| refFastaIndex | `File` | | Index for the reference fasta. |
| refDict | `File` | | The dict file for the reference Fasta. |
| refRefflat | `File?` | | A reference refRefflat file. If this is given RNA-seq metrics will be collected. |
| strandedness | `String?` | `"None"` | The strandedness of RNA-seq data. Only used when refRefflat is defined. Must be one of: "FR" (forward-reverse), "RF" (reverse-forward) or "None" (unstranded). |
| targetIntervals | `Array[File]+?` | | A list of targets intervals. If this is defined targeted PCR metrics will be collected. |
| ampliconIntervals | `File?` | | A list of amplicon intervals, required when targetIntervals is given. |
| picardMetrics.collectGcBiasMetrics | `Boolean` | `true` | Whether or not to collect GC-bias metrics. |
| picardMetrics.<br />collectAlignmentSummaryMetrics | `Boolean` | `true` | Whether or not to collect alignment summary metrics. |
| picardMetrics.<br />collectSequencingArtifactMetrics | `Boolean` | `true` | Whether or not to collect sequencing artifact metrics. |
| picardMetrics.<br />collectQualityYieldMetrics | `Boolean` | `true` | Whether or not to collect quality yield metrics. |
| picardMetrics.<br />collectBaseDistributionByCycle | `Boolean` | `true` | Whether or not to collect base distribution by cycle metrics. |
| picardMetrics.meanQualityByCycle | `Boolean` | `true` | Whether or not to collect mean quality by cycle metrics. |
| picardMetrics.<br />collectInsertSizeMetrics | `Boolean` | `true` | Whether or not to collect insert-size metrics. |
| picardMetrics.<br />qualityScoreDistribution | `Boolean` | `true` | Whether or not to collect quality score distribution metrics. |

>All inputs have to be preceded by with `BamMetrics.`.
Type is indicated according to the WDL data types: `File` should be indicators
of file location (a string in JSON). Types ending in `?` indicate the input is
optional, types ending in `+` indicate they require at least one element.

## Tool versions
Included in the repository is an `environment.yml` file. This file includes
all the tool version on which the workflow was tested. You can use conda and
this file to create an environment with all the correct tools.

## Output
A directory containing the various metrics collected.

## About
This workflow is part of [BioWDL](https://biowdl.github.io/)
developed by [the SASC team](http://sasc.lumc.nl/).

## Contact
<p>
  <!-- Obscure e-mail address for spammers -->
For any question related to BamMetrics, please use the
<a href='https://github.com/biowdl/bammetrics/issues'>github issue tracker</a>
or contact
 <a href='http://sasc.lumc.nl/'>the SASC team</a> directly at: <a href='&#109;&#97;&#105;&#108;&#116;&#111;&#58;&#115;&#97;&#115;&#99;&#64;&#108;&#117;&#109;&#99;&#46;&#110;&#108;'>
&#115;&#97;&#115;&#99;&#64;&#108;&#117;&#109;&#99;&#46;&#110;&#108;</a>.
</p>
