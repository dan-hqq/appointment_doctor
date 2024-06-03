class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Dapatkan tindak lanjut untuk janji temu Anda",
    image: "assets/images/Onboard1.png",
    desc:
        "Kelola janji temu dengan dokter Anda dan dapatkan informasi yang akurat",
  ),
  OnboardingContents(
    title: "Booking Dokter terbaik di sekitarmu",
    image: "assets/images/Onboard2.png",
    desc: "Lebih dari 100 dokter spesialis yang siap melayani Anda",
  ),
  OnboardingContents(
    title: "Lebih mudah dengan sistem yang aman",
    image: "assets/images/Onboard3.png",
    desc: "Kami mengutamakan kenyamanan dan keamanan bagi Anda dan dokter Anda",
  ),
];
