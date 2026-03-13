# MPV Profile Switcher

Compact profile cycle / toggle for [mpv](https://mpv.io/).

## Install

Copy `profile-switcher.lua` to `~~/scripts/`.

## Requirements

Profiles must include `profile-restore=copy-equal` for restore to work.

```ini
# mpv.conf
[gpu-hq]
profile-restore=copy-equal
scale=ewa_lanczossharp
dscale=mitchell
```

## Usage

```
script-message profile-cycle  <profile1> <profile2> [...]
script-message profile-toggle <profile>
```

### profile-cycle

Cycles through listed profiles and an **OFF** step (all restored to defaults).
Each press activates the next profile while restoring the previous one.

### profile-toggle

Toggles a single profile on/off.

### input.conf examples

```
F1 script-message profile-cycle  gpu-hq  upscale-anime  sharpen
F2 script-message profile-toggle gpu-hq
```

#### Cycle behavior for F1:

| Press | Active profile |
|-------|---------------|
| 1     | gpu-hq        |
| 2     | upscale-anime |
| 3     | sharpen       |
| 4     | *(all off)*   |
| 5     | gpu-hq        |
