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
    <i>struct(file : File, index : File, md5sum : String?) </i><i>&mdash; Default:</i> <code>None</code><br />
    ???
</dd>
<dt id="BamMetrics.reference"><a href="#BamMetrics.reference">BamMetrics.reference</a></dt>
<dd>
    <i>struct(dict : File, fai : File, fasta : File) </i><i>&mdash; Default:</i> <code>None</code><br />
    ???
</dd>
</dl>



## Other inputs
<details>
<summary> Show/Hide </summary>
<dl>
<dt id="BamMetrics.ampliconIntervals"><a href="#BamMetrics.ampliconIntervals">BamMetrics.ampliconIntervals</a></dt>
<dd>
    <i>File? </i><i>&mdash; Default:</i> <code>None</code><br />
    ???
</dd>
<dt id="BamMetrics.ampliconIntervalsLists.javaXmx"><a href="#BamMetrics.ampliconIntervalsLists.javaXmx">BamMetrics.ampliconIntervalsLists.javaXmx</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"4G"</code><br />
    ???
</dd>
<dt id="BamMetrics.ampliconIntervalsLists.memory"><a href="#BamMetrics.ampliconIntervalsLists.memory">BamMetrics.ampliconIntervalsLists.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"12G"</code><br />
    ???
</dd>
<dt id="BamMetrics.dockerImages"><a href="#BamMetrics.dockerImages">BamMetrics.dockerImages</a></dt>
<dd>
    <i>Map[String,String] </i><i>&mdash; Default:</i> <code>{"samtools": "quay.io/biocontainers/samtools:1.8--h46bd0b3_5", "picard": "quay.io/biocontainers/picard:2.20.5--0"}</code><br />
    ???
</dd>
<dt id="BamMetrics.outputDir"><a href="#BamMetrics.outputDir">BamMetrics.outputDir</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"."</code><br />
    ???
</dd>
<dt id="BamMetrics.picardMetrics.collectAlignmentSummaryMetrics"><a href="#BamMetrics.picardMetrics.collectAlignmentSummaryMetrics">BamMetrics.picardMetrics.collectAlignmentSummaryMetrics</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>true</code><br />
    ???
</dd>
<dt id="BamMetrics.picardMetrics.collectBaseDistributionByCycle"><a href="#BamMetrics.picardMetrics.collectBaseDistributionByCycle">BamMetrics.picardMetrics.collectBaseDistributionByCycle</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>true</code><br />
    ???
</dd>
<dt id="BamMetrics.picardMetrics.collectGcBiasMetrics"><a href="#BamMetrics.picardMetrics.collectGcBiasMetrics">BamMetrics.picardMetrics.collectGcBiasMetrics</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>true</code><br />
    ???
</dd>
<dt id="BamMetrics.picardMetrics.collectInsertSizeMetrics"><a href="#BamMetrics.picardMetrics.collectInsertSizeMetrics">BamMetrics.picardMetrics.collectInsertSizeMetrics</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>true</code><br />
    ???
</dd>
<dt id="BamMetrics.picardMetrics.collectQualityYieldMetrics"><a href="#BamMetrics.picardMetrics.collectQualityYieldMetrics">BamMetrics.picardMetrics.collectQualityYieldMetrics</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>true</code><br />
    ???
</dd>
<dt id="BamMetrics.picardMetrics.collectSequencingArtifactMetrics"><a href="#BamMetrics.picardMetrics.collectSequencingArtifactMetrics">BamMetrics.picardMetrics.collectSequencingArtifactMetrics</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>true</code><br />
    ???
</dd>
<dt id="BamMetrics.picardMetrics.javaXmx"><a href="#BamMetrics.picardMetrics.javaXmx">BamMetrics.picardMetrics.javaXmx</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"8G"</code><br />
    ???
</dd>
<dt id="BamMetrics.picardMetrics.meanQualityByCycle"><a href="#BamMetrics.picardMetrics.meanQualityByCycle">BamMetrics.picardMetrics.meanQualityByCycle</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>true</code><br />
    ???
</dd>
<dt id="BamMetrics.picardMetrics.memory"><a href="#BamMetrics.picardMetrics.memory">BamMetrics.picardMetrics.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"32G"</code><br />
    ???
</dd>
<dt id="BamMetrics.picardMetrics.qualityScoreDistribution"><a href="#BamMetrics.picardMetrics.qualityScoreDistribution">BamMetrics.picardMetrics.qualityScoreDistribution</a></dt>
<dd>
    <i>Boolean </i><i>&mdash; Default:</i> <code>true</code><br />
    ???
</dd>
<dt id="BamMetrics.refRefflat"><a href="#BamMetrics.refRefflat">BamMetrics.refRefflat</a></dt>
<dd>
    <i>File? </i><i>&mdash; Default:</i> <code>None</code><br />
    ???
</dd>
<dt id="BamMetrics.rnaSeqMetrics.javaXmx"><a href="#BamMetrics.rnaSeqMetrics.javaXmx">BamMetrics.rnaSeqMetrics.javaXmx</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"8G"</code><br />
    ???
</dd>
<dt id="BamMetrics.rnaSeqMetrics.memory"><a href="#BamMetrics.rnaSeqMetrics.memory">BamMetrics.rnaSeqMetrics.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"32G"</code><br />
    ???
</dd>
<dt id="BamMetrics.strandedness"><a href="#BamMetrics.strandedness">BamMetrics.strandedness</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"None"</code><br />
    ???
</dd>
<dt id="BamMetrics.targetIntervals"><a href="#BamMetrics.targetIntervals">BamMetrics.targetIntervals</a></dt>
<dd>
    <i>Array[File]+? </i><i>&mdash; Default:</i> <code>None</code><br />
    ???
</dd>
<dt id="BamMetrics.targetIntervalsLists.javaXmx"><a href="#BamMetrics.targetIntervalsLists.javaXmx">BamMetrics.targetIntervalsLists.javaXmx</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"4G"</code><br />
    ???
</dd>
<dt id="BamMetrics.targetIntervalsLists.memory"><a href="#BamMetrics.targetIntervalsLists.memory">BamMetrics.targetIntervalsLists.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"12G"</code><br />
    ???
</dd>
<dt id="BamMetrics.targetMetrics.javaXmx"><a href="#BamMetrics.targetMetrics.javaXmx">BamMetrics.targetMetrics.javaXmx</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"4G"</code><br />
    ???
</dd>
<dt id="BamMetrics.targetMetrics.memory"><a href="#BamMetrics.targetMetrics.memory">BamMetrics.targetMetrics.memory</a></dt>
<dd>
    <i>String </i><i>&mdash; Default:</i> <code>"12G"</code><br />
    ???
</dd>
</dl>
</details>


