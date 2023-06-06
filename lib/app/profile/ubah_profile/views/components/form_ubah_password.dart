part of ubah_profil;

class FormUbahPassword extends StatelessWidget {
  const FormUbahPassword({Key? key, required this.controller})
      : super(key: key);

  final UbahPasswordController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kSpacing),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(),
            _buildFormPasswordLama(),
            const SizedBox(),
            _buildFormPassword(),
            const SizedBox(),
            _buildFormVerPassword(),
          ],
        ),
      ),
    );
  }

  Widget _buildFormPasswordLama() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Password lama',
          maxLines: 1,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: kSpacing / 2),
        TxtField(
          placeholders: 'Masukkan password lama',
          inputAction: TextInputAction.next,
          inputType: TextInputType.visiblePassword,
          controller: controller.passwordLama,
        )
      ],
    );
  }

  Widget _buildFormPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Password Baru',
          maxLines: 1,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: kSpacing / 2),
        TxtField(
          placeholders: 'Masukkan password baru',
          inputAction: TextInputAction.next,
          inputType: TextInputType.visiblePassword,
          controller: controller.password,
        )
      ],
    );
  }

  Widget _buildFormVerPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Ulangi Password Baru',
          maxLines: 1,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: kSpacing / 2),
        TxtField(
          placeholders: 'Ulangi password baru',
          inputAction: TextInputAction.next,
          inputType: TextInputType.visiblePassword,
          controller: controller.verPassword,
        )
      ],
    );
  }
}
