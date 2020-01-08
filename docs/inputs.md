---
layout: default
title: Inputs
---

# Inputs for BamMetrics

The following is an overview of all available inputs in
BamMetrics.


## Required inputs
<dl>
<dt id="BamMetrics.bam"><a href="#BamMetrics.bam">BamMetrics.bam</a></dt>
<dd>
    <i>struct(file : File, index : File, md5sum : String?) </i><br />
    The BAM file and its index for which metrics will be collected.
</dd>
<dt id="BamMetrics.reference"><a href="#BamMetrics.reference">BamMetrics.reference</a></dt>
<dd>
    <i>struct(dict : File, fai : File, fasta : File) </i><br />
    The reference files: a fasta, its index and sequence dictionary.
</dd>
</dl>

## Other common inputs
<dl>
<dt id="BamMetrics.ampliconIntervals"><a href="#BamMetrics.ampliconIntervals">BamMetrics.ampliconIntervals</a></dt>
<dd>
    <i>File? </i><br />
    An interval list describinig the coordinates of the amplicons sequenced. This should only be used for targeted sequencing or WES. Required if `ampliconIntervals` is defined.
</dd>
<dt id="BamMetrics.outputDir"><a href="#BamMetrics.outputDir">BamMetrics.outputDir</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"."</code><br />
    The directory to which the outputs will be written.
</dd>
<dt id="BamMetrics.refRefflat"><a href="#BamMetrics.refRefflat">BamMetrics.refRefflat</a></dt>
<dd>
    <i>File? </i><br />
    A refflat file containing gene annotations. If defined RNA sequencing metrics will be collected.
</dd>
<dt id="BamMetrics.strandedness"><a href="#BamMetrics.strandedness">BamMetrics.strandedness</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"None"</code><br />
    The strandedness of the RNA sequencing library preparation. One of "None" (unstranded), "FR" (forward-reverse: first read equal transcript) or "RF" (reverse-forward: second read equals transcript).
</dd>
<dt id="BamMetrics.targetIntervals"><a href="#BamMetrics.targetIntervals">BamMetrics.targetIntervals</a></dt>
<dd>
    <i>Array[File]+? </i><br />
    An interval list describing the coordinates of the targets sequenced. This should only be used for targeted sequencing or WES. If defined targeted PCR metrics will be collected. Requires `ampliconIntervals` to also be defined.
</dd>
</dl>

## Advanced inputs
<details>
<summary> Show/Hide </summary>
<dl>
<dt id="BamMetrics.ampliconIntervalsLists.javaXmx"><a href="#BamMetrics.ampliconIntervalsLists.javaXmx">BamMetrics.ampliconIntervalsLists.javaXmx</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"4G"</code><br />
    The maximum memory available to the program. (Should be lower than `memory` to accommodate JVM overhead.
</dd>
<dt id="BamMetrics.ampliconIntervalsLists.memory"><a href="#BamMetrics.ampliconIntervalsLists.memory">BamMetrics.ampliconIntervalsLists.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"12G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="BamMetrics.dockerImages"><a href="#BamMetrics.dockerImages">BamMetrics.dockerImages</a></dt>
<dd>
    <i>Map[String,String] </i><i>&mdash; Default:</i> <code>{"samtools": "quay.io/biocontainers/samtools:1.8--h46bd0b3_5", "picard": "quay.io/biocontainers/picard:2.20.5--0"}</code><br />
    The docker images used. Changing this may result in errors which the developers may choose not to address.
</dd>
<dt id="BamMetrics.picardMetrics.collectAlignmentSummaryMetrics"><a href="#BamMetrics.picardMetrics.collectAlignmentSummaryMetrics">BamMetrics.picardMetrics.collectAlignmentSummaryMetrics</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>true</code><br />
    Equivalent to the `PROGRAM=CollectAlignmentSummaryMetrics` argument.
</dd>
<dt id="BamMetrics.picardMetrics.collectBaseDistributionByCycle"><a href="#BamMetrics.picardMetrics.collectBaseDistributionByCycle">BamMetrics.picardMetrics.collectBaseDistributionByCycle</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>true</code><br />
    Equivalent to the `PROGRAM=CollectBaseDistributionByCycle` argument.
</dd>
<dt id="BamMetrics.picardMetrics.collectGcBiasMetrics"><a href="#BamMetrics.picardMetrics.collectGcBiasMetrics">BamMetrics.picardMetrics.collectGcBiasMetrics</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>true</code><br />
    Equivalent to the `PROGRAM=CollectGcBiasMetrics` argument.
</dd>
<dt id="BamMetrics.picardMetrics.collectInsertSizeMetrics"><a href="#BamMetrics.picardMetrics.collectInsertSizeMetrics">BamMetrics.picardMetrics.collectInsertSizeMetrics</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>true</code><br />
    Equivalent to the `PROGRAM=CollectInsertSizeMetrics` argument.
</dd>
<dt id="BamMetrics.picardMetrics.collectQualityYieldMetrics"><a href="#BamMetrics.picardMetrics.collectQualityYieldMetrics">BamMetrics.picardMetrics.collectQualityYieldMetrics</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>true</code><br />
    Equivalent to the `PROGRAM=CollectQualityYieldMetrics` argument.
</dd>
<dt id="BamMetrics.picardMetrics.collectSequencingArtifactMetrics"><a href="#BamMetrics.picardMetrics.collectSequencingArtifactMetrics">BamMetrics.picardMetrics.collectSequencingArtifactMetrics</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>true</code><br />
    Equivalent to the `PROGRAM=CollectSequencingArtifactMetrics` argument.
</dd>
<dt id="BamMetrics.picardMetrics.javaXmx"><a href="#BamMetrics.picardMetrics.javaXmx">BamMetrics.picardMetrics.javaXmx</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"8G"</code><br />
    The maximum memory available to the program. (Should be lower than `memory` to accommodate JVM overhead.
</dd>
<dt id="BamMetrics.picardMetrics.meanQualityByCycle"><a href="#BamMetrics.picardMetrics.meanQualityByCycle">BamMetrics.picardMetrics.meanQualityByCycle</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>true</code><br />
    Equivalent to the `PROGRAM=MeanQualityByCycle` argument.
</dd>
<dt id="BamMetrics.picardMetrics.memory"><a href="#BamMetrics.picardMetrics.memory">BamMetrics.picardMetrics.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"32G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="BamMetrics.picardMetrics.qualityScoreDistribution"><a href="#BamMetrics.picardMetrics.qualityScoreDistribution">BamMetrics.picardMetrics.qualityScoreDistribution</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>true</code><br />
    Equivalent to the `PROGRAM=QualityScoreDistribution` argument.
</dd>
<dt id="BamMetrics.rnaSeqMetrics.javaXmx"><a href="#BamMetrics.rnaSeqMetrics.javaXmx">BamMetrics.rnaSeqMetrics.javaXmx</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"8G"</code><br />
    The maximum memory available to the program. (Should be lower than `memory` to accommodate JVM overhead.
</dd>
<dt id="BamMetrics.rnaSeqMetrics.memory"><a href="#BamMetrics.rnaSeqMetrics.memory">BamMetrics.rnaSeqMetrics.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"32G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="BamMetrics.targetIntervalsLists.javaXmx"><a href="#BamMetrics.targetIntervalsLists.javaXmx">BamMetrics.targetIntervalsLists.javaXmx</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"4G"</code><br />
    The maximum memory available to the program. (Should be lower than `memory` to accommodate JVM overhead.
</dd>
<dt id="BamMetrics.targetIntervalsLists.memory"><a href="#BamMetrics.targetIntervalsLists.memory">BamMetrics.targetIntervalsLists.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"12G"</code><br />
    The amount of memory this job will use.
</dd>
<dt id="BamMetrics.targetMetrics.javaXmx"><a href="#BamMetrics.targetMetrics.javaXmx">BamMetrics.targetMetrics.javaXmx</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"4G"</code><br />
    The maximum memory available to the program. (Should be lower than `memory` to accommodate JVM overhead.
</dd>
<dt id="BamMetrics.targetMetrics.memory"><a href="#BamMetrics.targetMetrics.memory">BamMetrics.targetMetrics.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"12G"</code><br />
    The amount of memory this job will use.
</dd>
</dl>
</details>




