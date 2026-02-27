import 'package:flutter/material.dart';

import 'package:reelhub/ui/core/company_logo.dart';
import 'package:reelhub/data/models/production_company/production_company_model.dart';

class ProductionCompanyList extends StatelessWidget {
  final List<ProductionCompany>? productionCompanies;
  final String? errorMessage;

  const ProductionCompanyList({
    super.key,
    this.productionCompanies,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    final bool hasCompanies =
        productionCompanies != null && productionCompanies!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Productions", style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16),
        if (errorMessage != null) Text(errorMessage!),
        if (errorMessage == null)
          SizedBox(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                if (hasCompanies)
                  ...productionCompanies!.map(
                    (item) => Row(
                      children: [
                        SizedBox(
                          width: 100,
                          height: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CompanyLogo(item),
                              const SizedBox(height: 8),
                              Text(
                                item.name,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ),
                if (!hasCompanies) Text("No Data"),
              ],
            ),
          ),
      ],
    );
  }
}
