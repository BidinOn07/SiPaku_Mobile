part of ubah_profil;

class FormUbahAkun extends StatelessWidget {
  const FormUbahAkun({Key? key, required this.controller}) : super(key: key);

  final UbahAkunController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kSpacing),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(),
            _buildFormUsername(),
            const SizedBox(),
            _buildFormNamaKader(),
            const SizedBox(),
            _buildFormJenisKelamin(),
            const SizedBox(),
            _buildFormAlamatLengkap(),
            const SizedBox(),
            _buildFormNomorTelp(),
          ],
        ),
      ),
    );
  }

  Widget _buildFormUsername() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Username',
          maxLines: 1,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: kSpacing / 2),
        TxtField(
          placeholders: 'Masukkan username',
          inputAction: TextInputAction.next,
          inputType: TextInputType.text,
          controller: controller.namaKader,
        )
      ],
    );
  }

  Widget _buildFormNamaKader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Nama',
          maxLines: 1,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: kSpacing / 2),
        TxtField(
          placeholders: 'Masukkan nama',
          inputAction: TextInputAction.next,
          inputType: TextInputType.text,
          controller: controller.namaKader,
        )
      ],
    );
  }

  Widget _buildFormJenisKelamin() {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Jenis Kelamin',
              maxLines: 1,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: kSpacing / 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kSpacing),
              child: Column(
                children: [
                  RadioButton(
                      title: "Laki-Laki",
                      value: controller.radioJenisKelamin[0],
                      groupValue: controller.selectJenisKelamin.value,
                      onTap: () => controller.onClickRadioButtonJenisKelamin(
                          controller.radioJenisKelamin[0])),
                  RadioButton(
                      title: "Perempuan",
                      value: controller.radioJenisKelamin[1],
                      groupValue: controller.selectJenisKelamin.value,
                      onTap: () => controller.onClickRadioButtonJenisKelamin(
                          controller.radioJenisKelamin[1]))
                ],
              ),
            )
          ],
        ));
  }

  Widget _buildFormAlamatLengkap() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Nama Alamat',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: kSpacing / 2),
        TxtField(
          placeholders: 'Masukkan Alamat',
          inputAction: TextInputAction.next,
          controller: controller.alamatLengkap,
          inputType: TextInputType.multiline,
          maxLines: 4,
        )
      ],
    );
  }

  Widget _buildFormNomorTelp() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Nomor Telepon',
          maxLines: 1,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: kSpacing / 2),
        TxtField(
          controller: controller.nomorTelp,
          placeholders: 'Masukkan Nomor Telepon',
          inputAction: TextInputAction.next,
          inputType: TextInputType.number,
        )
      ],
    );
  }
}
