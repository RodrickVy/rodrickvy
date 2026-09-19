---
title: Celebrated
summary: An iOS app that helps people remember, plan, and celebrate birthdays, with shared lists and automated reminders.
date: 2025-10-01
images: [celebrated.webp, celebrated_a.webp]
tags: [Flutter, Firebase, Cloud Functions, Auth]
links:
  - label: App Store
    url: https://apps.apple.com/ph/app/celebrated/id6753803549
  - label: Website
    url: https://celebratedapp.com
  - label: GitHub
    url: https://github.com/RodrickVy/celebrated_service
---

## Overview

Celebrated started as a side project after I forgot too many birthdays. You group people into lists like "family" or "classmates", and the app reminds you in time to plan something.

## Features

- Add birthdays manually, import them from contacts, or share a form link so people can add their own
- Share a list so others can follow it too
- Invite links that can be regenerated or destroyed, so a shared list doesn't stay open forever
- Reminders by push notification, email, or SMS

## Built with

- **Flutter** for the app
- **Firebase** for authentication and the database
- **Cloud Functions (TypeScript)** for a reminder service that schedules and sends notifications

## What it taught me

Shipping a full app on my own meant owning every layer: the data model, authentication, access rules for shared lists, background services, and App Store release.
