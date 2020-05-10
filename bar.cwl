class: Workflow
cwlVersion: v1.0
inputs:
- id: in1
  type: {items: boolean, label: A boolean array, name: my_boolean_array, type: array}
outputs:
- {id: out1, outputSource: s2/out1, type: string}
requirements:
  InlineJavascriptRequirement: {}
  SubworkflowFeatureRequirement: {}
steps:
  s1:
    in: {in1: in1}
    out: [out1]
    run:
      arguments:
      - {valueFrom: $(runtime)}
      baseCommand: echo
      class: CommandLineTool
      cwlVersion: v1.0
      inputs:
        in1:
          inputBinding: {position: 1, valueFrom: 'A_$(inputs.in1)_B_${return inputs.in1}_C_$(inputs.in1)'}
          type: {items: boolean, label: A boolean array, name: my_boolean_array, type: array}
      outputs:
        out1:
          outputBinding: {glob: out.txt, loadContents: true, outputEval: $(self)_D_$(runtime)}
          type: string
      requirements:
        InlineJavascriptRequirement: {}
      stdout: out.txt
  s2:
    in: {in1: s1/out1}
    out: [out1]
    run:
      arguments:
      - {valueFrom: $(runtime)}
      baseCommand: echo
      class: CommandLineTool
      cwlVersion: v1.0
      inputs:
        in1:
          inputBinding: {position: 1, valueFrom: 'A_$(inputs.in1)_B_${return inputs.in1}_C_$(inputs.in1)'}
          type: string
      outputs:
        out1:
          outputBinding: {glob: out.txt, loadContents: true, outputEval: $(self)_D_$(runtime)}
          type: string
      requirements:
        InlineJavascriptRequirement:
          expressionLib: ["var foo = function(x) {\n    return 2 * x\n}\n\nvar bar
              = function(n, x) {\n    return `{n} engineers walk into a {x}`\n}"]
      stdout: out.txt
