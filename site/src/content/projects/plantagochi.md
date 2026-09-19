---
title: Plantagochi
summary: A StormHacks project that turns a houseplant into a Tamagotchi. An ESP32 module reads the plant's health and shows its mood on a tiny OLED screen.
date: 2025-10-05
images: [storm_hacks.jpeg, storm_hacks_2.jpeg]
tags: [ESP32, C++, Node.js, IoT, Hackathon]
links:
  - label: GitHub
    url: https://github.com/RodrickVy/plantagochi_server
  - label: Devpost
    url: https://devpost.com/software/plantagochi
---

## Overview

Built over a weekend at **StormHacks**, SFU's hackathon hosted by SFU Surge. Our team of four Electronics Engineering and CST students gave plant care a twist by connecting it to the classic Tamagotchi game. Plug the module into a pot, and a small OLED screen shows your plant's mood and health.

## How it works

- Sensors on the module measure the plant's conditions
- An **ESP32** running **C++** firmware turns the readings into a mood and sends the data to a server
- A **Node.js** server stores the readings, and a web client displays the plant's history

## My role

Two teammates led the hardware: the electronics and sensor setup. Another teammate and I built the software, programming the ESP32 and writing the Node.js server and client. We worked across both sides throughout, debugging code and wiring at 3 a.m.

## What it taught me

Getting firmware, hardware, and a server to agree with each other under a deadline is humbling. It was also my first real look at how IoT devices send data over a network, which is where a lot of security problems start.
