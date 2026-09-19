---
title: Survivors' Stories API
summary: Scraped video data on residential school survivors' stories, exposed it through an API, and built a site to browse and link to them.
date: 2020-09-01
cover: survivors.png
tags: [JavaScript, Web scraping, REST API]
links:
  - label: Live site
    url: https://survivors-history.web.app
---

## Overview

Residential school survivors' testimonies were spread across many pages. I collected them in one place so they were easier to find.

## How it works

- A JavaScript scraper gathers each video's metadata
- The data is served from a simple **REST API**
- A lightweight website lets visitors search and open the videos

## What it taught me

Working with data I didn't control meant validating everything, handling missing fields, and scraping respectfully.
