---
title: Healthcare Security Lab
summary: A homelab I'm building to model a healthcare network that meets HIPAA, B.C. PIPA, and e-health privacy requirements.
date: 2026-09-01
status: Ongoing
tags: [Active Directory, Windows Server, OPNsense, VLANs, Proxmox]
links:
  - label: GitHub
    url: https://github.com/RodrickVy/security-lab-01-healthcare
---

## What it is

A lab I'm setting up at home to design and secure the network of a small healthcare clinic, the kind of environment where a misconfiguration exposes patient records. The goal is to build it the way a real organization would have to: aligned with HIPAA, B.C.'s PIPA, and e-health privacy requirements.

## What's going into it

- **Proxmox** as the hypervisor for every VM in the lab
- **OPNsense** as the edge firewall and router, with default-deny rules between segments
- **VLANs** isolating clinical systems, staff devices, guests, and management
- **Windows Server + Active Directory** for identity, DNS, and Group Policy
- Domain-joined clients to test hardening and access policies against

## Where it stands

This is a work in progress. I'm documenting each stage in the GitHub repo as I build it, including the mistakes.

## Next

Centralized logging and monitoring, so the network can be watched as well as defended.
