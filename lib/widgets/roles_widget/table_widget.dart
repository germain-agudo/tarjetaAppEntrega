import 'package:app_tarjeta/global/components.dart';
import 'package:app_tarjeta/services/components/role_service.dart';

import 'package:app_tarjeta/widgets/roles_widget/table_content..dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TableWidget extends StatelessWidget {
  // const TableWidget({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final RoleService roleService = Provider.of<RoleService>(context, listen: true); //que este pendiente de todos los cambios que emita provider

    return Table(
      children: <TableRow>[
        TableRow(children: <Widget>[
          GestureDetector(
            child: TableContent(Components.mainThemeColor, Icons.person, 'Joven'),
            onTap: () {
              roleService.role = 'USER_ROLE';

              Navigator.pushReplacementNamed(context, 'register');
            },
          ),
          GestureDetector(
            child: TableContent(Components.mainThemeColor, Icons.business, 'Empresaio'),
            onTap: () {
              roleService.role = 'EXTERNO_ROLE';
              Navigator.pushReplacementNamed(context, 'register');
            },
          ),
        ]),
      ],
    );
  }
}
