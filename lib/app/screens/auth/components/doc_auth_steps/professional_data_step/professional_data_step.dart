import 'package:careve/app/screens/auth/components/auth_input_field.dart';
import 'package:careve/app/screens/auth/components/doc_auth_steps/professional_data_step/cv_component.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/utilities/app_util.dart';
import 'package:careve/app/utilities/validators.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfessionalDataStep extends Step {
  ProfessionalDataStep({
    bool isActive = false,
    StepState stepState = StepState.editing,
  }) : super(
          title: !isActive
              ? const SizedBox.shrink()
              : FittedBox(
                  child: Text(
                    S.current.professionalData,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40.sp,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
          isActive: isActive,
          state: stepState,
          content: Directionality(
            textDirection:
                AppUtil.isLtr ? TextDirection.ltr : TextDirection.rtl,
            child: Form(
              key: AuthService.to.docVerificationFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AuthInputField(
                    S.current.nationalId,
                    AuthService.to.nationalId,
                    loading: AuthService.to.isBusy.value,
                    keyBoardType: TextInputType.number,
                    validator: const QuickTextValidator(
                      isNationalId: true,
                    ).call,
                  ),
                  CVComponent(),
                ],
              ),
            ),
          ),
        );
}
