import 'package:cokc/app/old-barn/model/old-barn.model.dart';
import 'package:cokc/app/old-barn/provider/old-barn.provider.dart';
import 'package:cokc/app/old-barn/provider/old-barn.state.dart';
import 'package:cokc/common/helper/action-dialog.helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OldBarnWidget extends ConsumerStatefulWidget {
  const OldBarnWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OldBarnWidgetState();
}

class _OldBarnWidgetState extends ConsumerState<OldBarnWidget> {
  @override
  void initState() {
    super.initState();
    ref.read(oldBarnProvider.notifier).getOldBarn();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(oldBarnProvider);

    ref.listen(oldBarnProvider, (state) {
      if (state is OldBarnErrorState) {
        showErrorDialog(context, state.message);
      }
    });

    return (state is OldBarnLoadedState)
        ? _view(state.oldBarn)
        : (state is OldBarnLoadingState)
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : const Center(
                child: Text('No old barn data.'),
              );
  }

  Widget _view(OldBarnModel model) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
          image: const AssetImage('asset/icon/resource/wood.png'),
          fit: BoxFit.fitWidth,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.3),
            BlendMode.dstATop,
          ),
        ),
      ),
      child: Column(
        children: [
          const Text(
            'OLD BARN',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Wrap(
            spacing: 5,
            children: [
              _resourceCounter('asset/icon/resource/wood.png', model.wood),
              _resourceCounter('asset/icon/resource/ore.png', model.ore),
              _resourceCounter('asset/icon/resource/fish.png', model.fish),
              _resourceCounter('asset/icon/resource/linen.png', model.linen),
              _resourceCounter(
                  'asset/icon/resource/item-part.png', model.itemPart),
            ],
          ),
        ],
      ),
    );
  }

  Widget _resourceCounter(String imagePath, int value) {
    return Column(
      children: [
        Image.asset(imagePath),
        Text(
          value.toString(),
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
