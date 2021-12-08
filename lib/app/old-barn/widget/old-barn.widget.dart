import 'package:cokc/app/old-barn/model/old-barn.model.dart';
import 'package:cokc/app/old-barn/provider/old-barn.provider.dart';
import 'package:cokc/app/old-barn/provider/old-barn.state.dart';
import 'package:cokc/app/resource/enum/resource-code.enum.dart';
import 'package:cokc/app/resource/model/resource.model.dart';
import 'package:cokc/common/helper/action-dialog.helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OldBarnWidget extends ConsumerStatefulWidget {
  const OldBarnWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OldBarnWidgetState();
}

class _OldBarnWidgetState extends ConsumerState<OldBarnWidget> {
  bool _editmode = false;

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
        ? _view(state.oldBarn, state.resourceList)
        : (state is OldBarnLoadingState)
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : const Center(
                child: Text('No old barn data.'),
              );
  }

  Widget _view(OldBarnModel model, List<ResourceModel> resourceList) {
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
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              !_editmode ? Icons.edit : Icons.cancel,
              color: Colors.white,
            ),
            onPressed: () => setState(() => _editmode = !_editmode),
          ),
          Column(
            children: [
              const Text(
                'OLD BARN',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Wrap(
                spacing: 10,
                children: [
                  _resourceCounter(
                    ResourceCode.wood,
                    'asset/icon/resource/wood.png',
                    model.wood,
                  ),
                  _resourceCounter(
                    ResourceCode.ore,
                    'asset/icon/resource/ore.png',
                    model.ore,
                  ),
                  _resourceCounter(
                    ResourceCode.fish,
                    'asset/icon/resource/fish.png',
                    model.fish,
                  ),
                  _resourceCounter(
                    ResourceCode.linen,
                    'asset/icon/resource/linen.png',
                    model.linen,
                  ),
                  _resourceCounter(
                    ResourceCode.part,
                    'asset/icon/resource/item-part.png',
                    model.itemPart,
                  ),
                ],
              ),
              !_editmode
                  ? const SizedBox.shrink()
                  : Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(5),
                      color: Colors.white24,
                      child: Wrap(
                        spacing: 5,
                        children: resourceList
                            .map((e) => InkWell(
                                  child: SizedBox(
                                    width: 30.0,
                                    height: 30.0,
                                    child: Image.asset(
                                      e.imagePath,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  onTap: () {
                                    if (_editmode) {
                                      ref
                                          .read(oldBarnProvider.notifier)
                                          .addResource(e.code);
                                    }
                                  },
                                ))
                            .toList(),
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _resourceCounter(ResourceCode code, String imagePath, int value) {
    return InkWell(
      onTap: () {
        if (_editmode) {
          ref.read(oldBarnProvider.notifier).removeResource(code);
        }
      },
      child: Column(
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: Image.asset(imagePath),
          ),
          Text(
            value.toString(),
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
