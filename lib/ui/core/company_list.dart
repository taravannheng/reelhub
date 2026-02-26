import 'package:flutter/material.dart';

import 'package:reelhub/ui/core/company_logo.dart';
import 'package:reelhub/data/models/production_company/production_company_model.dart';

class ProductionCompanyList extends StatelessWidget {
  final List<ProductionCompany>? productionCompanies;
  final String? errorMessage;
  final bool isLoading;

  const ProductionCompanyList({
    super.key,
    this.productionCompanies,
    this.errorMessage,
    this.isLoading = false,
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
        if (isLoading) CircularProgressIndicator.adaptive(),
        if (errorMessage != null && !isLoading) Text(errorMessage!),
        if (errorMessage == null && !isLoading)
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                if (hasCompanies)
                  ...productionCompanies!.map(
                    (item) => Row(
                      children: [
                        SizedBox(width: 100, child: CompanyLogo(item)),
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
