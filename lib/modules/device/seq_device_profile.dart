enum SeqDeviceProfileId {
  HEATER,
  TEMP_HUMI_SENSOR,
  CO_SENSOR,
  SMOKE_SONSOR,
  CO_CONCENTRATION_SENSOR,
  CAMERA,
  WATER_METER
}

const Map<SeqDeviceProfileId, String> seqDeviceProfileIdToStringMap = {
  SeqDeviceProfileId.HEATER: 'baa09350-0d6f-11ed-983c-617014bef18f',
  SeqDeviceProfileId.TEMP_HUMI_SENSOR: 'd8206890-2db0-11ed-b3d7-ab40826c689b',
  SeqDeviceProfileId.CO_SENSOR: '51774470-0d7c-11ed-84d9-ff9e26bd77fb',
  SeqDeviceProfileId.SMOKE_SONSOR: '6ef725b0-0d7c-11ed-aacb-b50e53f41cc8',
  SeqDeviceProfileId.CO_CONCENTRATION_SENSOR: '247b9110-656a-11ed-a40f-6527c4d13844',
  SeqDeviceProfileId.CAMERA: '97c31730-6126-11ed-bb6e-8f34ea6bbc86',
  SeqDeviceProfileId.WATER_METER: '99c6f5b0-2e5e-11ed-b3d7-ab40826c689b',
};