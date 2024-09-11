export const validateImage = (image: string) => {
  if (image.startsWith("https://cdn.discordapp.com/attachments/")) {
    return image;
  }

  return "https://cdn.discordapp.com/attachments/952588860624338994/1023476259159805982/bahamas_senior.png";
};
