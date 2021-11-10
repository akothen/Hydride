step = 8
top = """(dsl_inst_1
                          (dsl_inst_0
                            (bv 0 (bitvector 128))
                            (mem)
                            (vector-shuffle-ext-special
                              (vector-shuffle-special
                                (mem)
                                (mem)
                                8 8)
                              (vector-shuffle-special

                                (mem)

                                (mem)
                                8 8)
                                """
bottom =  """
                            2 8 8 8)
                          2 8)
                          """
with open("replicate.txt","w+") as WriteFile:
    i =0

    while i < 16:
        text = top + " 16 8 {} {})\n".format(i, step) + bottom

        WriteFile.write(text)
        i += step


